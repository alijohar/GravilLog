import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../business/entities/auth_entity.dart';
import '../../business/entities/user_entity.dart';
import '../../business/usecases/login.dart';
import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObscured = true.obs;
  var hasEmail = false.obs;
  var hasPassword = false.obs;
  var loading = false.obs;
  late AuthRepositoryImpl authRepositoryImpl;

  late LocalPreferences localDataSource;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool ssoEnabledAndroid = true;
  bool ssoEnabledIos = true;

  @override
  Future<void> onInit() async {
    localDataSource = LocalPreferences(
      await SharedPreferences.getInstance(),
    );
    authRepositoryImpl = AuthRepositoryImpl(
      remoteDataSource: AuthRemoteDataSourceImpl(),
      localDataSource: localDataSource,
      networkInfo: NetworkInfoImpl(
        DataConnectionChecker(),
      ),
    );
    super.onInit();
  }

  void toggleObscure() => isObscured.toggle();

  void navigateToSignup() {
    // Navigation zu SignUp
  }

  void navigateToForgotPassword() {
    // Navigation zu Forgot Password
  }

  void patientLoginWithEmail() {
 eitherFailureOrLogin(AuthParams.login(password:"123" , patient:true , email: "majd"));
  }

  Future<void> facebookLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {}


  void eitherFailureOrLogin(AuthParams authParams) async {
    print("eitherFailureOrLoginnnnn");
    final failureOrLogin = await Login(authRepository:authRepositoryImpl).call(
    authParams: authParams,
    );

    failureOrLogin.fold(
    (Failure newFailure) {
    // userIntity = null;
    // failure = newFailure;
    // flowState.value = ErrorState(StateRendererType.popupErrorState, failure?.errorMessage??"Error");

    },
    (AuthEntity userEntity) {

    // flowState.value = ContentState();
    // userEntity = userEntity;
    // isUserLogin.value = true;
    // failure = null;
    // Get.offAllNamed(Routes.searchRoute);

    },
    );
  }
}



// class LoginController extends GetxController {
//   AuthEntity? authEntity;
//   Failure? failure;
//
//   void eitherFailureOrLogin() async {
//     AuthRepositoryImpl repository = AuthRepositoryImpl(
//       remoteDataSource: AuthRemoteDataSourceImpl(),
//       localDataSource: AuthLocalDataSourceImpl(
//         sharedPreferences: await SharedPreferences.getInstance(),
//       ),
//       networkInfo: NetworkInfoImpl(
//         DataConnectionChecker(),
//       ),
//     );
//
//     final failureOrLogin = await Login(authRepository: repository).call(
//       authParams: AuthParams(),
//     );
//
//     failureOrLogin.fold(
//       (Failure newFailure) {
//         authEntity = null;
//         failure = newFailure;
//       },
//       (AuthEntity newAuth) {
//         authEntity = newAuth;
//         failure = null;
//       },
//     );
//   }
// }
