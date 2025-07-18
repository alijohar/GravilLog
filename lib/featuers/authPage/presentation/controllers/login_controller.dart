import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/entities/auth_entity.dart';
import '../../business/usecases/get_auth.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

class LoginController extends GetxController {
  AuthEntity? authEntity;
  Failure? failure;

  void eitherFailureOrLogin() async {
    AuthRepositoryImpl repository = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: AuthLocalDataSourceImpl(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );

    final failureOrLogin = await Login(authRepository: repository).call(
      authParams: AuthParams(),
    );

    failureOrLogin.fold(
      (Failure newFailure) {
        authEntity = null;
        failure = newFailure;
      },
      (AuthEntity newAuth) {
        authEntity = newAuth;
        failure = null;
      },
    );
  }
}
