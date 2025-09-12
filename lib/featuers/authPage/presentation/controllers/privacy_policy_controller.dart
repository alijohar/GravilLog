import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/local_preferences/local_preferences.dart';

class PrivacyPolicyController extends GetxController {


  var loading = true.obs;
  LocalPreferences localDataSource = Get.find();
  var currentLanguage = "en".obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    localDataSource = LocalPreferences(
        await SharedPreferences.getInstance(),
    );
    currentLanguage.value = getDeviceLanguage();
    loading.value = false;
    print("currentLanguage ist ${currentLanguage.value}");
  }

  String getDeviceLanguage(){
    return  localDataSource.getLanguage()??Get.deviceLocale?.languageCode??'en';

  }


}
