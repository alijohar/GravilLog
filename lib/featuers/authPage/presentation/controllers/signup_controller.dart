import 'dart:async';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/featuers/authPage/business/usecases/signUp.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/params/params.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/deviceUtils.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

class SignupController extends GetxController {
  var isObscured = true.obs;
  var hasEmail = false.obs;
  var hasPassword = false.obs;
  var loading = false.obs;
  var isChecked = false.obs;

  //?needed variables for ui
  var hasName = false.obs;
  var hasPhone = false.obs;
  var passwordConfirmed = false.obs;
  bool get canMoveToNextPage =>
      hasEmail.value && hasName.value && hasPhone.value;

  bool get canCreateAccount => passwordAccepted && isChecked.value;

  bool get passwordAccepted => hasPassword.value && passwordConfirmed.value;
  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool ssoEnabledAndroid = true;
  bool ssoEnabledIos = true;

  GestureTapCallback? get navigateToTermsOfUseView =>
      () => Get.toNamed(Routes.termsOfUseRoute);

  GestureTapCallback get navigateToPrivacyPolicyView =>
      () => Get.toNamed(Routes.privacyPolicyRoute);
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

  navigateToLogin() {
    Get.toNamed(Routes.loginRoute);
  }

  navigateToSignUpPasswords() {
    Get.toNamed(Routes.signUpPasswordsRoute);
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
    _eitherFailureOrSignUp(AuthParams.register(
      password: password,
      phoneNumber: phoneNumber,
      email: email,
      countryCode: countryCode,
    ));
  }

  Future<void> facebookLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {}

  Future _eitherFailureOrSignUp(AuthParams authParams) async {
    loading.value = true;
    final failureOrSignup = await Signup(authRepository: authRepositoryImpl)(
      authParams: authParams,
    );

    failureOrSignup.fold(
      (newFailure) {
        loading.value = false;

        Deviceutils.showToastMessage(
            "error_occurred_try_again".tr, Get.context!);
        return;
      },
      (authResultModel) {
        loading.value = false;
        if (authResultModel.error == AppConstants.SIGNUP_DUPLICATE) {
          Deviceutils.showToastMessage(
              "already_account_created".tr, Get.context!);
          return;
        }
        if (authResultModel.token?.isEmpty == true) {
          // Deviceutils.showToastMessage(
          //     "please_verify_your_account".tr, Get.context!);
          Deviceutils.showCustomDialog(Get.context!,
              title: "check_you_email".tr,
              bodyText: "please_verify_your_account".tr,
              buttonText: 'back_to_login'.tr,
              isDismissible: false,
              buttonAction: () => Get.offAllNamed(Routes.loginRoute));
          return;
        }
        //?everything works perfectly and used signed up
        //?i think this case is hard to happened because if an error happened we won't reach this
        //?case and if every thing went well we also won't get this case because he need to
        //?verify his email
        Get.offAllNamed(Routes.loginRoute);
      },
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
