
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/featuers/questions/data/models/sync_health_status_result_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/base/base_model.dart';
import '../../../../core/connection/dio_remote.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../authPage/data/models/get_pregnancy_result_model.dart';
import '../../../authPage/data/models/patient_info_result_model.dart';
import '../models/pregnant_info_model.dart';

abstract class QuestionRemoteDataSource {
  Future<SyncHealthStatusResultModel> sendPregnetInfo({required PregnantInfoParams pregnantInfoParams, required String token});
  Future<GetPregnancyResultModel> getPregneces({ required String token});
  Future<SyncHealthStatusResultModel> syncHealth({required PregnantInfoParams pregnantInfoParams, required String token});

  Future<PatientInfoResultModel> getPatient({required String token});

}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {

  @override
  Future<SyncHealthStatusResultModel> sendPregnetInfo({required PregnantInfoParams pregnantInfoParams, required String token}) async {
    try {


      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',

        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.SAVE_PREGNANCY,
          "params": {
            "token": token,
            "data": {
              "pregnancy_id": 0,
              "pregnancy_number": 1,
              "first_visit_date": pregnantInfoParams.firstVisitDate,
              "expected_delivery_place": "",
              "expected_delivery_date": pregnantInfoParams.expectedDeliveryDate,
              "expected_delivery_mode": 1,
              "important_notes": "",
            },
          },
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);


      // if (response.statusCode == 200) {
        return SyncHealthStatusResultModel.fromJson(response.result);
      // } else {
      //   throw ServerException();
      // }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<GetPregnancyResultModel> getPregneces({required String token}) async {
    try {

      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',

        data: {

          "jsonrpc": "2.0",
          "method": AppConstants.GET_PREGNANCIES,
          "params": {"token": token},
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);


      // if (response.statusCode == 200) {
      return GetPregnancyResultModel.fromJson(response.result);
      // } else {
      //   throw ServerException();
      // }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<SyncHealthStatusResultModel> syncHealth({required PregnantInfoParams pregnantInfoParams, required String token}) async {
    try {

      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',

        data: {

          "jsonrpc": "2.0",
          "method": AppConstants.SYNC_HEALTH_STATUS,
          "params": {
            "token": token,
            "data": {
              "first_day_last_period": pregnantInfoParams.firstVisitDate,
              "expected_delivery_date":  pregnantInfoParams.expectedDeliveryDate,
              "is_pregnant": true,
            },
          },
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);


      // if (response.statusCode == 200) {
      return SyncHealthStatusResultModel.fromJson(response.result);
      // } else {
      //   throw ServerException();
      // }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }

  @override
  Future<PatientInfoResultModel> getPatient({required String token}) async {
    try {

      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',

        data: {

          "jsonrpc": "2.0",
          "method": AppConstants.GET_PATIENT,
          "params": {"token": token},
          "id": 0,
        },
      );

      var response = BaseResModel.fromJson(baseResponse);


      // if (response.statusCode == 200) {
      return PatientInfoResultModel.fromJson(response.result);
      // } else {
      //   throw ServerException();
      // }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }
}
