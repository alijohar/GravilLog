import 'package:get/get.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

class OnboardingController extends GetxController {
  LocalPreferences localDataSource = Get.find();
  final currentIndex = 0.obs;



// return image path based on language
 String imagePath() {
    if (localDataSource.getLanguage() == 'ar') {
      return 'assets/images/onboard2_ar.svg';
    } else {
      return 'assets/images/onboard2.svg';
    }
  }
  // make it late to initialize it in onInit method
  late List<String> onboardImages;

  @override
  void onInit() {
    super.onInit();
    // initialize onboard images list
    onboardImages = [
      'assets/images/onboard1.svg',
      imagePath(),
      'assets/images/onboard3.svg',
    ];
  }

  navigateToLogin() {
    Get.toNamed(Routes.loginRoute);
  }

  navigateToSignup() {
    Get.toNamed(Routes.signUpRoute);
  }
}
