import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/resources/deviceUtils.dart';
import '/featuers/authPage/business/usecases/getPatientInfo.dart';
import '/featuers/authPage/business/usecases/getPregnacyInfo.dart';
import '/featuers/authPage/data/models/auth_result_model.dart';
import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../business/usecases/login.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/get_pregnancy_result_model.dart';
import '../../data/models/patient_info_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

class LoginController extends GetxController {
  var isObscured = true.obs;
  var hasEmail = false.obs;
  var hasPassword = false.obs;
  var loading = false.obs;
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
    eitherFailureOrLogin(
        AuthParams.login(password: password, patient: true, email: email));
  }

  Future<void> facebookLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {}

  void eitherFailureOrLogin(AuthParams authParams) async {
    print("eitherFailureOrLoginnnnn");
    loading.value = true;
    final failureOrLogin = await Login(authRepository: authRepositoryImpl).call(
      authParams: authParams,
    );

    failureOrLogin.fold(
      (Failure newFailure) {
        loading.value = false;
        Deviceutils.showToastMessage(
            "error_occurred_try_again".tr, Get.context!);
      },
      (AuthResultModel authResultModel) async {
        if (authResultModel.token is String) {
          final pregnancyInfoSaved = await eitherFailureOrGetPregnacyInfo(
              AuthParams(token: authResultModel.token));
          if (!pregnancyInfoSaved) {
            loading.value = false;
            Deviceutils.showToastMessage(
                "error_occurred_try_again".tr, Get.context!);
            return;
          }

          final patientInfoRespone = await eitherFailureOrgetPatientInfo(
              AuthParams(token: authResultModel.token));

          bool patientInfoSaved =
              await localDataSource.savePatientInfo(patientInfoRespone);
          bool tokenSaved = await localDataSource
              .saveUserSession(authResultModel as AuthResultModel);
          if (tokenSaved && patientInfoSaved) {
            loading.value = false;

            if (patientInfoRespone?.patient?.healthStatus?.isPregnant != null) {
              print("navigation to home");
              // _navigationService.pushNamedAndRemoveUntil(Routes.homeLayoutView);
            } else {
              // print("navigation to pregnantQuestionView");
              Get.offAllNamed(Routes.pregnantQuestionRoute);

              // _navigationService.pushNamedAndRemoveUntil(Routes.pregnantQuestionView);
            }
          } else {
            loading.value = false;

            print("Something went wrong, try again later");
          }
        } else {
          loading.value = false;

          Deviceutils.showToastMessage(
              "incorrect_credentials".tr, Get.context!);
        }
      },
    );
  }

  Future<bool> eitherFailureOrGetPregnacyInfo(AuthParams authParams) async {
    loading.value = true;

    final failureOrLogin = await GetPregnacyInfo(
      authRepository: authRepositoryImpl,
    ).call(authParams: authParams);

    return await failureOrLogin.fold(
      (Failure newFailure) async {
        return false;
      },
      (GetPregnancyResultModel getPregnancyResponse) async {
        final pregnancyInfoSaved =
            await localDataSource.savePregnancyInfo(getPregnancyResponse);
        return pregnancyInfoSaved;
      },
    );
  }

  Future<PatientInfoResultModel?> eitherFailureOrgetPatientInfo(
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
      (PatientInfoResultModel patientInfoResultModel) async {
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
