import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

class LanguageController extends GetxController {
  LocalPreferences localDataSource = Get.find();
  var currentLanguage = "en".obs;

  @override
  void onInit() {
    super.onInit();
    localDataSource = Get.find<LocalPreferences>();
    currentLanguage.value = getDeviceLanguage();
    log("currentLanguage is ${currentLanguage.value}");
  }

  Future<void> onContinue() async {
    await changeLanguage(currentLanguage.value);
    await setDeviceLanguage(currentLanguage.value);
    Get.toNamed(Routes.onboardingRoute);
  }

  Future<void> changeLanguage(String languageCode) async {
    await Get.updateLocale(Locale(languageCode));
  }

  Future<void> setDeviceLanguage(String languageCode) async {
    await localDataSource.setLanguage(languageCode);
  }

  String getDeviceLanguage() {
    return localDataSource.getLanguage() ??
        Get.deviceLocale?.languageCode ??
        'en';
  }
}
