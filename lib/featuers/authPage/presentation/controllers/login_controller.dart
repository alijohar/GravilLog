import 'dart:developer';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/resources/deviceUtils.dart';
import '/featuers/authPage/business/usecases/getPatientInfo.dart';
import '../../business/usecases/get_pregnancy_info.dart';
import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../business/usecases/login.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/patient_info_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

class LoginController extends GetxController {
  var isObscured = true.obs;
  var hasEmail = false.obs;
  var hasPassword = false.obs;
  var loading = false.obs;
  final saveSession = false.obs;
  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ssoEnabledAndroid = true;
  bool ssoEnabledIos = true;

  @override
  void onInit() {
    super.onInit();
    localDataSource = Get.find<LocalPreferences>();
    authRepositoryImpl = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: localDataSource,
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );
  }

  void toggleObscure() => isObscured.toggle();

  void navigateToSignup() {
    Get.toNamed(Routes.signUpRoute);
  }

  void navigateToForgotPassword() {
    Get.toNamed(Routes.forgetPasswordRoute);
  }

  void patientLoginWithEmail() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validate email and password before proceeding
    if (email.isEmpty) {
      Deviceutils.showToastMessage(
          "kindly_enter_email_address".tr, Get.context!);
      return;
    }

    if (!_isValidEmail(email)) {
      Deviceutils.showToastMessage(
          "kindly_enter_valid_email_address".tr, Get.context!);
      return;
    }

    if (password.isEmpty) {
      Deviceutils.showToastMessage("kindly_enter_password".tr, Get.context!);
      return;
    }
    _eitherFailureOrLogin(
        AuthParams.login(password: password, patient: true, email: email));
  }

  Future<void> facebookLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {}

  void _eitherFailureOrLogin(AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin = await Login(authRepository: authRepositoryImpl)(
      authParams: authParams,
    );

    failureOrLogin.fold(
      (failure) {
        loading.value = false;

        Deviceutils.showToastMessage(failure.errorMessage.tr, Get.context!);
      },
      (result) async {
        await _eitherFailureOrGetPregnancyInfo(
          AuthParams(
            token: result.token,
          ),
        );

        final patientInfoResponse =
            await _eitherFailureOrGetPatientInfo(AuthParams(
          token: result.token,
        ));

        loading.value = false;
        //?this means this user already old because if he is not
        //?we won't have info about if he pregnant or not
        if (patientInfoResponse?.patient?.healthStatus?.isPregnant != null) {
          log("navigation to home");
          //_navigationService.pushNamedAndRemoveUntil(Routes.homeLayoutView);
        } else {
          Get.offAllNamed(Routes.pregnantQuestionRoute);
        }
      },
    );
  }

  Future<bool> _eitherFailureOrGetPregnancyInfo(AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin = await GetPregnancyInfo(
      authRepository: authRepositoryImpl,
    ).call(authParams: authParams);

    return await failureOrLogin.fold(
      (newFailure) {
        return false;
      },
      (getPregnancyResponse) async {
        final isSaved = await authRepositoryImpl
            .savePregnancyInfoLocally(getPregnancyResponse);
        log('pregnancy info saved');
        return isSaved.isRight();
      },
    );
  }

  Future<PatientInfoResultModel?> _eitherFailureOrGetPatientInfo(
      AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin =
        await GetPatientInfo(authRepository: authRepositoryImpl).call(
      authParams: authParams,
    );

    return await failureOrLogin.fold(
      (Failure newFailure) async {
        return null;
      },
      (patientInfoResultModel) async {
        final saved = await authRepositoryImpl
            .savePatientInfoLocally(patientInfoResultModel);
        log('patient info saved: ${saved.isRight()}');

        return patientInfoResultModel;
      },
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
