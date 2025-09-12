import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';
import 'package:gravilog_2025/featuers/authPage/business/usecases/getPatientInfo.dart';
import 'package:gravilog_2025/featuers/authPage/business/usecases/getPregnacyInfo.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/auth_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../business/entities/auth_result_entity.dart';
import '../../business/entities/user_entity.dart';
import '../../business/usecases/login.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/get_pregnancy_result_model.dart';
import '../../data/models/patient_info_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Future<void> onInit() async {
    localDataSource = LocalPreferences(
      await SharedPreferences.getInstance(),
    );
    authRepositoryImpl = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: localDataSource,
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );
    super.onInit();
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
      Deviceutils.flushBarMessage(AppStrings.kindlyEnterEmailAddress, Get.context!);
      return;
    }

    if (!_isValidEmail(email)) {
      Deviceutils.flushBarMessage(AppStrings.kindlyEnterValidEmailAddress, Get.context!);
      return;
    }

    if (password.isEmpty) {
      Deviceutils.flushBarMessage(AppStrings.kindlyEnterPassword, Get.context!);
      return;
    }
 eitherFailureOrLogin(AuthParams.login(password:password , patient:true , email: email));
  }

  Future<void> facebookLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {}


  void eitherFailureOrLogin(AuthParams authParams) async {
    print("eitherFailureOrLoginnnnn");
    loading.value = true;
    final failureOrLogin = await Login(authRepository:authRepositoryImpl).call(
    authParams: authParams,
    );

    failureOrLogin.fold(
    (Failure newFailure) {
    loading.value = false;
    Deviceutils.flushBarMessage("${AppStrings.errorOccurredTryAgain}", Get.context!);


    },
    (AuthResultModel authResultModel) async {
      if (authResultModel.token is String) {
        final pregnancyInfoSaved = await eitherFailureOrGetPregnacyInfo(AuthParams(token:authResultModel.token ));
        if (!pregnancyInfoSaved) {
          loading.value = false;
          Deviceutils.flushBarMessage(AppStrings.errorOccurredTryAgain, Get.context!);
          return;
        }

        final patientInfoRespone = await eitherFailureOrgetPatientInfo(AuthParams(token:authResultModel.token ));

        bool patientInfoSaved = await localDataSource.savePatientInfo(patientInfoRespone);
        bool tokenSaved = await localDataSource.saveUserSession(authResultModel as AuthResultModel);
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
        }
        else {
          loading.value = false;

          print("Something went wrong, try again later");
          }
      }
      else {
        loading.value = false;

        Deviceutils.flushBarMessage(AppStrings.incorrectCredentials.tr, Get.context!);
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




  Future<PatientInfoResultModel?>  eitherFailureOrgetPatientInfo(AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin = await GetPatientInfo(authRepository:authRepositoryImpl).call(
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



