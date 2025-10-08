import 'dart:ui';

import 'package:get/get.dart';

import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

class LanguageController extends GetxController {
   late LocalPreferences localDataSource;
   var currentLanguage = "en".obs;

  @override
  void onInit() {
    super.onInit();
    localDataSource = Get.find<LocalPreferences>();
    currentLanguage.value = getDeviceLanguage();
    print("currentLanguage ist ${currentLanguage.value}");
  }

  Future<void> onContinue() async {

     await changeLanguage(currentLanguage.value);
     await setDeviceLanguage(currentLanguage.value);
     Get.toNamed(Routes.onboardingRoute);

  }

    changeLanguage(String languageCode) async{
   await  Get.updateLocale(Locale(languageCode));
  }





    setDeviceLanguage(String languageCode )async{
    await localDataSource.setLanguage(languageCode);
  }
   String getDeviceLanguage(){
    return  localDataSource.getLanguage()??Get.deviceLocale?.languageCode??'en';

  }
}
