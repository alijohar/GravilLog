import 'package:get/get.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/language_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/login_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../featuers/splash/presentation/controllers/splash_controller.dart';
import '../local_preferences/local_preferences.dart';


class MainBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await _initLocalPreferences();
    Get.lazyPut(()=> LoginController(),fenix: true);

    Get.lazyPut(()=> SplashController(),fenix: true);

    Get.lazyPut(()=> LanguageController(),fenix: true);

    Get.lazyPut(()=> OnboardingController(),fenix: true);

  }

  Future<void> _initLocalPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put(LocalPreferences(sharedPreferences), permanent: true);
  }
}