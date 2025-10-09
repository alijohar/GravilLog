import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/routes_manager.dart';

enum SplashStates {
  loggedInCompleted,
  loggedInButNotCompletedProfile,
  onBoardingViewedButNotLoggedIn,
  firstVisit,
}

class SplashController extends GetxController {
  late LocalPreferences localDataSource;
  late Timer _timer;

  @override
  void onInit() async {
    super.onInit();
    _initLocalData().then((_) => _startDelay());
  }

  Future<void> _initLocalData() async {
    localDataSource = LocalPreferences(await SharedPreferences.getInstance());
  }

  void _startDelay() {
    _timer = Timer(
        const Duration(seconds: AppConstants.splashDelay), checkUserStatus);
  }

  Future<void> checkUserStatus() async {
    final user = localDataSource.getUser();
    bool isUserLoggedIn = user != null;
    SplashStates state;
    if (isUserLoggedIn) {
      bool isOnCompletedProfile = await localDataSource.isOnCompletedProfile();

      state = isOnCompletedProfile
          ? SplashStates.loggedInCompleted
          : SplashStates.loggedInButNotCompletedProfile;
    } else {
      final isViewOnBoarding = await localDataSource.isOnBoardingScreenViewed();
      state = isViewOnBoarding
          ? SplashStates.onBoardingViewedButNotLoggedIn
          : SplashStates.firstVisit;
    }
    log("========================$state");

    switch (state) {
      case SplashStates.loggedInCompleted:
      //navigate to home screen
      // Get.offAllNamed(Routes.mainRoute);
        break;
      case SplashStates.loggedInButNotCompletedProfile:
      //navigate to complete profile screen
      // Get.offAllNamed(Routes.completeProfileRoute);
        break;
      case SplashStates.onBoardingViewedButNotLoggedIn:
      //navigate to complete login screen
      // Get.offAllNamed(Routes.loginRoute);
        break;
      case SplashStates.firstVisit:
        Get.offAllNamed(Routes.languageRoute);
        break;
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
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
