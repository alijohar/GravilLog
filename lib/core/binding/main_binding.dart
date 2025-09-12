import 'package:get/get.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/forget_password_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/language_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/login_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/privacy_policy_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/term_of_use_controller.dart';
import 'package:gravilog_2025/featuers/questions/presentation/controllers/pregnet_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../featuers/authPage/presentation/controllers/signup_controller.dart';
import '../../featuers/questions/presentation/controllers/expect_delivery_controller.dart';
import '../../featuers/questions/presentation/controllers/menstrual_period_controller.dart';
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

    Get.lazyPut(()=> OnboardingController(),fenix: true);

    Get.lazyPut(()=> SignupController(),fenix: true);

    Get.lazyPut(()=> PrivacyPolicyController(),fenix: true);
    Get.lazyPut(()=> TermsOfUseController(),fenix: true);

    Get.lazyPut(()=> ForgetPasswordController(),fenix: true);

    Get.lazyPut(()=> PregnantQuestionController(),fenix: true);

    Get.lazyPut(()=> MenstrualPeriodController(),fenix: true);

    Get.lazyPut(()=> ExpectDeliveryController(),fenix: true);





  }

  Future<void> _initLocalPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put(LocalPreferences(sharedPreferences), permanent: true);
  }
}