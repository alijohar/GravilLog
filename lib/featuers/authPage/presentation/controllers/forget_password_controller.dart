import 'dart:async';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';
import 'package:gravilog_2025/featuers/authPage/business/usecases/resetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/params/params.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../business/entities/auth_result_entity.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/models/auth_result_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

class ForgetPasswordController extends GetxController {

  var emailController = TextEditingController();
  var loading = false.obs;
  var hasEmail = false.obs;
  var selectLanguage = "en".obs;
  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;

  bool _isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    ).hasMatch(email);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    emailController.addListener(() {
      hasEmail.value = emailController.text.isNotEmpty;
    });
    localDataSource = LocalPreferences(
        await SharedPreferences.getInstance(),
    );
    _loadUserLanguage();

    authRepositoryImpl = AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(),
    localDataSource: localDataSource,
    networkInfo: NetworkInfoImpl(
    DataConnectionChecker(),
    ),
    );

  }

  Future<void> _loadUserLanguage() async {
    selectLanguage.value = await localDataSource.getLanguage()??Get.deviceLocale?.languageCode??'en';
  }

  Future<void> resetPassword(BuildContext context) async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Deviceutils.flushBarMessage(AppStrings.kindlyEnterEmailAddress.tr, context);
      return;
    }

    if (!_isValidEmail(email)) {
      Deviceutils.flushBarMessage(AppStrings.kindlyEnterValidEmailAddress.tr, context);
      return;
    }

    eitherFailureOrResetPassword(AuthParams.resetPassword(email:email, language: selectLanguage.value ));


  }



  void eitherFailureOrResetPassword(AuthParams authParams) async {
    loading.value = true;
    final failureOrLogin = await Resetpassword(authRepository:authRepositoryImpl).call(
      authParams: authParams,
    );

    failureOrLogin.fold(
          (Failure newFailure) {
        loading.value = false;
        Deviceutils.flushBarMessage(AppStrings.errorOccurredTryAgain.tr, Get.context!);


      },
          (AuthResultModel authResultModel) async {
            loading.value = false;
            if (authResultModel.result == AppConstants.EMAIL_SENT) {
              Deviceutils.flushBarMessage(AppStrings.pleaseCheckYourInboxResetPassword.tr, Get.context!);
              Timer(const Duration(seconds: 5), () => Get.back());
            } else if (authResultModel.error == AppConstants.PATIENT_NOT_FOUND) {
              Deviceutils.flushBarMessage(AppStrings.patientNotFoundPleaseCheckEmail.tr, Get.context!);
            }

      },

    );
  }

}
