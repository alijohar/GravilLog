import 'package:get/get.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';


class SplashController extends GetxController {
  late LocalPreferences localDataSource;

  @override
  void onInit() {
    super.onInit();
    // Get the already initialized LocalPreferences from MainBindings
    localDataSource = Get.find<LocalPreferences>();
  }

  checkUserStatus() async {
    bool isUserLoggedIn = localDataSource.getUser() != null;



    if (isUserLoggedIn) {
      bool isOnCompletedProfile = await localDataSource
          .isOnCompletedProfile();
      print("isOnCompletedProfile ${isOnCompletedProfile}");
      if(isOnCompletedProfile) {
        // Navigate to the main screen
        // Get.offAllNamed(Routes.completeProfileRoute);

      }else{
        // _loadSavedData();

        // Get.offAllNamed(Routes.mainRoute);

      }
    } else {
      bool isOnBoardingScreenViewed = await localDataSource
          .isOnBoardingScreenViewed();
      if (isOnBoardingScreenViewed) {
        // Navigate to the login screen
        Get.offAllNamed(Routes.languageRoute);

      } else {
        // Navigate to the onboarding screen
        Get.offAllNamed(Routes.languageRoute);
        // Get.offAllNamed(Routes.onboardingRoute);
      }
    }
  }

  // Future<void> _loadSavedData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   bool? isacceptedcall = await prefs.getBool('is_accepted');
  //   bool? isrejectedcall = await prefs.getBool('is_rejected');
  //
  //   print('is accepted or not $isacceptedcall');
  //   if (isacceptedcall == true) {
  //     // Handle call end action
  //     String? dataaccepted = await prefs.getString('is_accepted_data');
  //     if (dataaccepted!.isNotEmpty) {
  //       await prefs.setBool('is_accepted', false);
  //       print('is accepted dataaccepted $dataaccepted}');
  //       var extra = jsonDecode(dataaccepted);
  //
  //       Get.offAll(const ReciveCallPage(),arguments: extra);
  //
  //       await prefs.setString('is_accepted_data', '');
  //
  //     }
  //   }else if (isrejectedcall == true) {
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setBool('is_accepted', false);
  //       await prefs.setString('is_accepted_data', '');
  //     }
  //
  //   else{
  //   Get.offAllNamed(Routes.mainRoute);
  //   }
  //
  // }
}
