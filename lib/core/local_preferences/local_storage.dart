import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gravilog_2025/featuers/authPage/business/entities/auth_result_entity.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/auth_result_model.dart';

import '../../featuers/authPage/data/models/get_pregnancy_result_model.dart';
import '../../featuers/authPage/data/models/patient_info_result_model.dart';
import '../../featuers/authPage/data/models/user_model.dart';
import '../../featuers/questions/data/models/pregnant_info_model.dart';

abstract class LocalStorage {
  Future<bool> savePregnancyInfo(GetPregnancyResultModel data);
  Future<bool> saveUserSession(AuthResultModel data);
  Future<Pair<bool, String>> getUserSession();
  Future<bool> savePatientInfo(PatientInfoResultModel data);
  Rx<UserModel>? getUser();
  setUser(UserModel user);
  setOnBoardingScreenViewed();
  isOnBoardingScreenViewed();
  setLanguage(String languageCode);
  getLanguage();
  Future<bool> isOnCompletedProfile();
  Future<void> setOnCompletedProfile(bool isOnCompleteProfile);
}
