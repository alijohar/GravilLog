import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../business/entities/auth_result_entity.dart';

class LanguageController extends GetxController {
   LocalPreferences localDataSource = Get.find();
   var currentLanguage = "en".obs;


  Future<void> onInit() async {
    super.onInit();
    localDataSource = LocalPreferences(
      await SharedPreferences.getInstance(),
    );
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
