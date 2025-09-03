import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/language_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/onboarding_page.dart';
import 'package:gravilog_2025/featuers/splash/presentation/pages/splash_page.dart';

import '../../featuers/authPage/presentation/pages/login_page.dart';


class Routes {
  static const String loginRoute = "/login";
  static const String SplaschRoute = "/";
  static const String languageRoute = "/language";
  static const String onBoardingRoute = "/onBoarding";








}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages() {
    return [

      GetPage(name: Routes.loginRoute, page: () => const LoginView()),

      GetPage(name: Routes.SplaschRoute, page: () => const SplashView()),

      GetPage(name: Routes.languageRoute, page: () => const LanguageView()),
      GetPage(name: Routes.onBoardingRoute, page: () =>  OnboardView()),


    ];
  }


  static unDefinedPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    );
  }
}
