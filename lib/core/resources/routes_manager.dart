import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';

import '../../featuers/authPage/presentation/pages/login_page.dart';


class Routes {
  static const String loginRoute = "/login";


  




}

class RouteGenerator {
  static List<GetPage<dynamic>> getPages() {
    return [

      GetPage(name: Routes.loginRoute, page: () => const LoginPage()),


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
