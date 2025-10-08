import 'package:get/get.dart';

import '../../../../core/local_preferences/local_preferences.dart';

class TermsOfUseController extends GetxController {

  var loading = true.obs;
  late LocalPreferences localDataSource;
  var currentLanguage = "en".obs;
  
  @override
  void onInit() {
    super.onInit();
    localDataSource = Get.find<LocalPreferences>();
    currentLanguage.value = getDeviceLanguage();
    loading.value = false;
    print("currentLanguage ist ${currentLanguage.value}");
  }

  String getDeviceLanguage(){
    return  localDataSource.getLanguage()??Get.deviceLocale?.languageCode??'en';

  }

}
