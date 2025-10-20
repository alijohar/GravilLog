import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/auth_result_model.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/get_pregnancy_result_model.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/patient_info_result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../featuers/authPage/data/models/user_model.dart';
import '../../featuers/questions/data/models/pregnant_info_model.dart';
import '../resources/constants_manager.dart';
import 'local_storage.dart';


class LocalPreferences extends LocalStorage {
  SharedPreferences instance;
  LocalPreferences(this.instance);
  @override
  Rx<UserModel>? getUser() {
    try {
      String? userStr = instance.getString("user");
      if(userStr == null) return null;
      var user = UserModel.fromJson(json.decode(userStr),fromLocal: true);
      return user.obs;
    } catch (e) {
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
  Future<void>setLanguage(String languageCode) async{
    await instance.setString(AppConstants.PREFS_KEY_LANGUAGE, languageCode);
  }

  @override

  String? getLanguage() {
    // Retrieve the language code from shared preferences or persistent storage
    return instance.getString(AppConstants.PREFS_KEY_LANGUAGE);
  }

  @override
  Future<bool> savePregnancyInfo(GetPregnancyResultModel data) async {
    try {
      await instance.setString(AppConstants.PREGNANCY_INFO, jsonEncode(data.toJson()));
    return true;
    } catch (e) {
    print('Error saving user pregnancy info: $e');
    return false;
    }
  }

  @override
  Future<bool> savePatientInfo(PatientInfoResultModel? data) async {
    try {
      if(data==null) return false;
      await instance.setString(AppConstants.PATIENT_INFO, jsonEncode(data.toJson()));
    return true;
    } catch (e) {
    print('Error saving user session: $e');
    return false;
    }
  }

  @override
  Future<bool> saveUserSession(AuthResultModel data) async {
    try {
      final token = data.token;
      if (token != null && token is String) {
        await instance.setString(AppConstants.TOKEN, token);
    return true;
    } else {
    print('Error: Token is null or not a string');
    return false;
    }
    } catch (e) {
    print('Error saving user session: $e');
    return false;
    }
  }
  @override
  Future<Pair<bool, String>> getUserSession() async {
    try {
      final token = instance.getString(AppConstants.TOKEN);
      if (token != null) {
        return Pair(true, token);
      } else {
        print('Error: Token is null or not a string');
        return Pair(false, '');
      }
    } catch (e) {
      print('Error occurred while fetching token: $e');
      return Pair(false, '');
    }
  }

}