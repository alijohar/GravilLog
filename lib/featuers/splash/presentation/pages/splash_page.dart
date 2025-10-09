import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/app_back_ground.dart';
import '../../../../core/resources/app_spaces.dart';
import '../../../../core/resources/assets_manager.dart';
import '../controllers/splash_controller.dart';

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