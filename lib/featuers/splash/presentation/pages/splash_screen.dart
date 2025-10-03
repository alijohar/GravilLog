import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_spaces.dart';
import 'package:gravilog_2025/core/resources/assets_manager.dart';
import 'package:gravilog_2025/featuers/splash/presentation/controllers/splash_controller.dart';

import '../../../../core/resources/app_back_ground.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AppBackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssets.splashLogoAr),
            const HeightSpace(29),
            Image.asset(ImageAssets.splashLogoEn),
          ],
        ),
      ),
    );
  }
}
