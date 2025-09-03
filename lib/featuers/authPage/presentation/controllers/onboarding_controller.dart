import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

class OnboardingController extends GetxController {
  LocalPreferences localDataSource = Get.find();
  final currentIndex = 0.obs;



  final List<String> onboardImages = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
    'assets/images/onboard3.png',
  ];
   onInit()  {
    super.onInit();

  }

  navigateToLogin() {
     Get.toNamed(Routes.loginRoute);
  }

  navigateToSignup() {}


}
