import 'dart:async';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/featuers/authPage/business/usecases/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/params/params.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/deviceUtils.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/auth_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

class SignupController extends GetxController {
  var isObscured = true.obs;
  var hasEmail = false.obs;
  var hasName = false.obs;
  var hasPhone = false.obs;
  var hasPassword = false.obs;
  var loading = false.obs;
  var isChecked = false.obs;

  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool ssoEnabledAndroid = true;
  bool ssoEnabledIos = true;

  GestureTapCallback? get navigateToTermsOfUseView =>
      () => Get.toNamed(Routes.termsOfUseRoute);

  GestureTapCallback get navigateToPrivacyPolicyView =>
      () => Get.toNamed(Routes.privacyPolicyRoute);
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
    // Navigation zu SignUp
  }

  void navigateToForgotPassword() {
    Get.toNamed(Routes.forgetPasswordRoute);
  }

  patientSignupWithEmail(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String countryCode = countryCodeController.text.trim();
    String phoneNumber = phoneController.text.trim();

    // Validate email and password before proceeding
    if (email.isEmpty) {
      Deviceutils.showToastMessage("kindly_enter_email_address".tr, context);
      return;
    }

    if (!_isValidEmail(email)) {
      Deviceutils.showToastMessage(
          "kindly_enter_valid_email_address".tr, context);
      return;
    }

    if (password.isEmpty) {
      Deviceutils.showToastMessage("kindly_enter_password".tr, context);
      return;
    }

    if (password.length < 6) {
      Deviceutils.showToastMessage(
          "kindly_enter_character_password".tr, context);
      return;
    }
    eitherFailureOrSignUp(AuthParams.register(
        password: password,
        phoneNumber: phoneNumber,
        email: email,
        countryCode: countryCode));
  }

  Future<void> facebookSignUp() async {}

  Future<void> googleSignUp() async {}

  Future<void> appleSignUp() async {}

  void eitherFailureOrSignUp(AuthParams authParams) async {
    loading.value = true;
    final failureOrSignup =
        await Signup(authRepository: authRepositoryImpl).call(
      authParams: authParams,
    );

    failureOrSignup.fold(
      (Failure newFailure) {
        loading.value = false;

        Deviceutils.showToastMessage(
            "error_occurred_try_again".tr, Get.context!);
      },
      (AuthResultModel authResultModel) {
        loading.value = false;

        if (authResultModel.token?.isEmpty == true) {
          Deviceutils.showToastMessage(
              "please_verify_your_account".tr, Get.context!);
        }

        if (authResultModel.error == AppConstants.SIGNUP_DUPLICATE) {
          Deviceutils.showToastMessage(
              "already_account_created".tr, Get.context!);
        }

        Timer(Duration(seconds: 5), () {
          Get.offAllNamed(Routes.loginRoute);
        });
      },
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
