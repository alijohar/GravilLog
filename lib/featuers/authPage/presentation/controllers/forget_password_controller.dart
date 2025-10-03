import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/core/resources/routes_manager.dart';
import 'package:gravilog_2025/featuers/authPage/business/usecases/resetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/params/params.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/auth_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

class ForgetPasswordController extends GetxController {
  var emailController = TextEditingController();
  var loading = false.obs;
  var hasEmail = false.obs;
  var selectLanguage = "en".obs;
  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;

  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController.addListener(() {
      hasEmail.value = emailController.text.isNotEmpty;
    });
    localDataSource = LocalPreferences(
      await SharedPreferences.getInstance(),
    );
    _loadUserLanguage();

    authRepositoryImpl = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: localDataSource,
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );
  }

  _navigateToLogin() {
    Get.offAllNamed(Routes.loginRoute);
  }

  Future<void> _loadUserLanguage() async {
    selectLanguage.value = await localDataSource.getLanguage() ??
        Get.deviceLocale?.languageCode ??
        'en';
  }

  Future<void> resetPassword(BuildContext context) async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Deviceutils.showToastMessage("kindly_enter_email_address".tr, context);
      return;
    }

    if (!_isValidEmail(email)) {
      Deviceutils.showToastMessage(
          "kindly_enter_valid_email_address".tr, context);
      return;
    }

    Deviceutils.showCustomDialog(context,
        title: "check_you_email".tr,
        bodyText: 'we_sent_reset_link'.tr,
        buttonText: 'back_to_login'.tr,
        isDismissible: false,
        buttonAction: () => _navigateToLogin());

    eitherFailureOrResetPassword(
        AuthParams.resetPassword(email: email, language: selectLanguage.value));
  }

  void eitherFailureOrResetPassword(AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin =
        await Resetpassword(authRepository: authRepositoryImpl).call(
      authParams: authParams,
    );

    failureOrLogin.fold(
      (Failure newFailure) {
        loading.value = false;
        Deviceutils.showToastMessage(
            "error_occurred_try_again".tr, Get.context!);
      },
      (AuthResultModel authResultModel) async {
        loading.value = false;
        if (authResultModel.result == AppConstants.EMAIL_SENT) {
          Deviceutils.showToastMessage(
              "please_check_your_inbox_reset_password".tr, Get.context!);
          Timer(const Duration(seconds: 5), () => Get.back());
        } else if (authResultModel.error == AppConstants.PATIENT_NOT_FOUND) {
          Deviceutils.showToastMessage(
              "patient_not_found_please_check_email".tr, Get.context!);
        }
      },
    );
  }
}
