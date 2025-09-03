import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../featuers/authPage/data/models/user_model.dart';
import '../resources/constants_manager.dart';
import 'local_storage.dart';


class LocalPreferences extends LocalStorage {
  SharedPreferences instance;
  LocalPreferences(this.instance);
  ///Aliali123#
  @override
  Rx<UserModel>? getUser() {
    try {
      String? userStr = instance.getString("user");
      if(userStr == null) return null;
      var user = UserModel.fromJson(json.decode(userStr),fromLocal: true);
      return user.obs;
    } catch (e, t) {
      debugPrint('Fetch local user $e');
      return null;
    }
  }
  @override
  setUser(UserModel? user) async {
    if (user == null) {
      instance.remove("user");
      instance.clear();
      debugPrint("removed");
    } else {
      if (await instance.setString("user", json.encode(user.toJson()))) {
        debugPrint("saved");
      } else {
        debugPrint("not saved");
      }
    }
  }

  // on boarding

  @override
  Future<void> setOnBoardingScreenViewed() async {
    // instance.setBool(AppConstants.PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }


  @override
  Future<bool> isOnBoardingScreenViewed() async {
    return
      // instance.getBool(AppConstants.PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
          false;
  }

  @override
  Future<void> setOnCompletedProfile(bool isOnCompleteProfile) async {
    print("setOnCompletedProfile ${isOnCompleteProfile}");
    // instance.setBool(AppConstants.PREFS_KEY_COMPLETE_PROFILE, isOnCompleteProfile);
  }


  @override
  Future<bool> isOnCompletedProfile() async {
    return
      // instance.getBool(AppConstants.PREFS_KEY_COMPLETE_PROFILE) ??
        false;
  }

  @override
  setLanguage(String languageCode) {
    instance.setString(AppConstants.PREFS_KEY_LANGUAGE, languageCode);
  }

  @override

  String? getLanguage() {
    // Retrieve the language code from shared preferences or persistent storage
    return instance.getString(AppConstants.PREFS_KEY_LANGUAGE);
  }
}