import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/language_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/forget_password_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/language_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/onboarding_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/privacy_policy_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/signup_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/terms_of_use_page.dart';
import 'package:gravilog_2025/featuers/questions/presentation/pages/due_date_page.dart';
import 'package:gravilog_2025/featuers/questions/presentation/pages/pregnet_page.dart';
import 'package:gravilog_2025/featuers/splash/presentation/controllers/splash_controller.dart';
import 'package:gravilog_2025/featuers/splash/presentation/pages/splash_page.dart';

import '../../featuers/authPage/presentation/pages/login_page.dart';
import '../../featuers/authPage/presentation/pages/sign_up_password_page.dart';
import '../../featuers/questions/presentation/pages/expect_delivery_page.dart';
import '../../featuers/questions/presentation/pages/menstrual_period_page.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String languageRoute = "/language";
  static const String onboardingRoute = "/onboarding";
  static const String signUpRoute = "/signUp";
  static const String signUpPasswordsRoute = "/signUp-passwords";
  static const String privacyPolicyRoute = "/privacyPolicy";
  static const String termsOfUseRoute = "/termsOfUse";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String pregnantQuestionRoute = "/pregnantQuestion";
  static const String menstrualPeriodRoute = "/menstrualPeriod";
  static const String expectDeliveryRoute = "/expectDelivery";
  static const String duePeriodRoute = "/duePeriod";
}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(
          name: Routes.splashRoute,
          page: () => const SplashView(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          })),
      GetPage(name: Routes.loginRoute, page: () => const LoginView()),
      GetPage(name: Routes.languageRoute, page: () => const LanguageView()),
      GetPage(name: Routes.onboardingRoute, page: () => OnboardView()),
      GetPage(name: Routes.signUpRoute, page: () => const SignupView()),
      GetPage(
          name: Routes.signUpPasswordsRoute,
          page: () => const SignupPasswordsView()),
      GetPage(name: Routes.privacyPolicyRoute, page: () => PrivacyPolicyView()),
      GetPage(name: Routes.termsOfUseRoute, page: () => TermsOfUseView()),
      GetPage(
          name: Routes.forgetPasswordRoute,
          page: () => const ForgetPasswordView()),
      GetPage(
          name: Routes.pregnantQuestionRoute,
          page: () => const PregnantQuestionView()),
      GetPage(
          name: Routes.menstrualPeriodRoute, page: () => MenstrualPeriodView()),
      GetPage(name: Routes.duePeriodRoute, page: () => DueDateView()),
      GetPage(
          name: Routes.expectDeliveryRoute, page: () => ExpectDeliveryView()),
    ];
  }

  static unDefinedPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("noRouteFound".tr),
      ),
      body: Center(child: Text("noRouteFound".tr)),
    );
  }
}
