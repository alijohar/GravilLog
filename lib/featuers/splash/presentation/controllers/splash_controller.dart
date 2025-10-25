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

  @override
  void onInit() async {
    super.onInit();
    _initLocalData().then((_) => _startDelay());
  }

  Future<void> _initLocalData() async {
    localDataSource = LocalPreferences(await SharedPreferences.getInstance());
  }

  void _startDelay() {
    // Add a small delay to ensure UI is ready before navigation
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      checkUserStatus();
    });
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
    log("===========splash state=============$state");

    switch (state) {
      case SplashStates.loggedInCompleted:
        //navigate to home screen
        Get.offAllNamed(Routes.homeRoute);
        break;
      case SplashStates.loggedInButNotCompletedProfile:
        //navigate to complete profile screen
        Get.offAllNamed(Routes.pregnantQuestionRoute);
        break;
      case SplashStates.onBoardingViewedButNotLoggedIn:
        //navigate to complete login screen
        Get.offAllNamed(Routes.loginRoute);
        break;
      case SplashStates.firstVisit:
        Get.offAllNamed(Routes.languageRoute);
        break;
    }
  }
}
