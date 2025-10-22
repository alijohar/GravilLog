import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

class LanguageController extends GetxController {
  LocalPreferences localDataSource = Get.find();
  var currentLanguage = "en".obs;
  Future<void> initLanguage() async {
    final savedLang = getDeviceLanguage();
    currentLanguage.value = savedLang;

    await Get.updateLocale(Locale(savedLang));

    log("Initialized language: $savedLang");
  }

  @override
  void onInit() {
    super.onInit();
    log("currentLanguage is ${currentLanguage.value}");
  }

  Future<void> onContinue() async {
    await setDeviceLanguage(currentLanguage.value);
    await changeLanguage(currentLanguage.value);
    Get.toNamed(Routes.onboardingRoute);
  }

  Future<void> changeLanguage(String languageCode) async {
    currentLanguage.value = languageCode;
    await localDataSource.setLanguage(languageCode);
    await Get.updateLocale(Locale(languageCode));

  }

  Future<void> setDeviceLanguage(String languageCode) async {
    await localDataSource.setLanguage(languageCode);
    log("Language saved: $languageCode");
  }

  String getDeviceLanguage() {
    return localDataSource.getLanguage() ??
        Get.deviceLocale?.languageCode ??
        'en';
  }
}
