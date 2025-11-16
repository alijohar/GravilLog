
import 'package:gravilog_2025/featuers/profile/presentation/pages/change_mode_page.dart';

import 'barrel_routes.dart';

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
  static const String questionScreenRoute = "/menstrualPeriod";
  static const String lastPeriodQuestionRoute = "/lastPeriod";
  static const String expectDeliveryRoute = "/expectDelivery";
  static const String duePeriodRoute = "/duePeriod";
  static const String homeRoute = "/home-screen";
  static const String settingsScreenRoute = "/settings-screen";
  static const String relationToHusbandRoute = "/relation_to_husband";
  static const String profilePageRoute= "/profile_page";
  static const String medicalHistoryPageRoute = "/medical_history_page";
  static const String bloodTypePageRoute = "/blood_type_page";
  static const String babyGenderPageRoute = "/baby_gender_page";
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
          name: Routes.questionScreenRoute,
          page: () => const NavQuestionPage()),
      GetPage(
          name: Routes.pregnantQuestionRoute,
          page: () => const PregnantQuestionPage()),
      GetPage(
          name: Routes.lastPeriodQuestionRoute,
          page: () => const LastPeriodQuestionPage()),
      GetPage(
          name: Routes.signUpPasswordsRoute,
          page: () => const SignupPasswordsView()),
      GetPage(name: Routes.privacyPolicyRoute, page: () => PrivacyPolicyView()),
      GetPage(name: Routes.termsOfUseRoute, page: () => TermsOfUseView()),
      GetPage(
          name: Routes.forgetPasswordRoute,
          page: () => const ForgetPasswordView()),
      GetPage(
          name: Routes.expectDeliveryRoute,
          page: () => ExpectDeliveryView()),
      GetPage(name: Routes.homeRoute,
          page: () => const HomeView()),

      GetPage(name: Routes.settingsScreenRoute,
          page: () => const SettingsPage()),
      GetPage(name: Routes.relationToHusbandRoute,
          page: () => const RelationToHusbandPage()),
      GetPage(name: Routes.profilePageRoute,
          page: () => const ProfilePage()),
      GetPage(name: Routes.medicalHistoryPageRoute,
          page: () => const MedicalHistoryPage()),
      GetPage(name: Routes.bloodTypePageRoute,
          page: () => const BloodTypePage()),
      GetPage(name: Routes.babyGenderPageRoute,
          page: () => const BabyGenderPage()),

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
