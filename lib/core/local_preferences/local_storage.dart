import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../featuers/authPage/data/models/user_model.dart';

abstract class LocalStorage{
  Rx<UserModel>? getUser();
  setUser(UserModel user);
  setOnBoardingScreenViewed();
  isOnBoardingScreenViewed();
  setLanguage(String languageCode);
  getLanguage();

}