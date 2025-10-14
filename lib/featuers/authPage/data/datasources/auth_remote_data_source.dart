import '../../../../../core/params/params.dart';
import '../../../../core/base/base_model.dart';
import '../../../../core/connection/dio_remote.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/constants_manager.dart';
import '../models/auth_result_model.dart';
import '../models/get_pregnancy_result_model.dart';
import '../models/patient_info_result_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResultModel> login({required AuthParams authParams});
  Future<AuthResultModel> signup({required AuthParams authParams});

  Future<AuthResultModel> resetPassword({required AuthParams authParams});

  Future<PatientInfoResultModel> getPatientInfo(
      {required AuthParams authParams});

  Future<GetPregnancyResultModel> getPregnacyInfo(
      {required AuthParams authParams});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthResultModel> login({required AuthParams authParams}) async {
    try {
      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',
        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.LOGIN,
          "params": {
            "patient": authParams.patient,
            "email": authParams.email,
            "password": authParams.password,
          },
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);

      var authRepone = AuthResultModel.fromJson(response.result);
      return authRepone;
    } on Exception catch (e) {
      print("the BaseResModel Exception is ${e.toString()}");

      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<AuthResultModel> signup({required AuthParams authParams}) async {
    try {
      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',
        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.NEW_PATIENT,
          "params": {
            "data": {
              "first_name": authParams.name,
              "country_id": 1,
              "email": authParams.email,
              "password": authParams.password,
              "phone": "${authParams.countryCode}${authParams.phoneNumber}",
              // if (deviceAddress != null) "device_address" : deviceAddress,
              // "device_token":"place holder for device token",
              "device_language": authParams.language ?? "en"
            }
          },
          "id": 0,
        },
      );
      var response = BaseResModel.fromJson(baseResponse);

      var authRepone = AuthResultModel.fromJson(response.result);
      return authRepone;
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<PatientInfoResultModel> getPatientInfo(
      {required AuthParams authParams}) async {
    try {
      print("getPatientInfoInfoooooooo ${authParams.token}");

      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',
        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.GET_PATIENT,
          "params": {
            "token": authParams.token,
          },
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);

      var patientInfoResultModel =
          PatientInfoResultModel.fromJson(response.result);

      return patientInfoResultModel;
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<GetPregnancyResultModel> getPregnacyInfo(
      {required AuthParams authParams}) async {
    try {
      print("getPregnacyInfoooooooo ${authParams.token}");
      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',
        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.GET_PREGNANCIES,
          "params": {
            "token": authParams.token,
          },
          "id": 0,
        },
      );
      var response = BaseResModel.fromJson(baseResponse);

      var pregnancyResultModel =
          GetPregnancyResultModel.fromJson(response.result);

      return pregnancyResultModel;
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<AuthResultModel> resetPassword(
      {required AuthParams authParams}) async {
    try {
      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',
        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.RESET_PASSWORD,
          "params": {
            "email": authParams.email,
            "language": authParams.language,
            "doctor": false,
          },
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);

      var authRepone = AuthResultModel.fromJson(response.result);
      return authRepone;
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }
}
