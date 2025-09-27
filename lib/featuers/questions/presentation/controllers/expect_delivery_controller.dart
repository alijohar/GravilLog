import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gravilog_2025/core/params/params.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/featuers/questions/business/usecases/get_pregneces.dart';
import 'package:gravilog_2025/featuers/questions/business/usecases/send_pregnet_info.dart';
import 'package:gravilog_2025/featuers/questions/business/usecases/sync_health.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../../authPage/data/models/get_pregnancy_result_model.dart';
import '../../../authPage/data/models/patient_info_result_model.dart';
import '../../business/usecases/get_patient.dart';
import '../../data/datasources/question_remote_data_source.dart';
import '../../data/models/pregnant_info_model.dart';
import '../../data/models/sync_health_status_result_model.dart';
import '../../data/repositories/question_repository_impl.dart';

class ExpectDeliveryController extends GetxController {


  // Reactive variables
  late Rx<Pregnant> pregnantData;
  late Rx<DateTime> deliveryDate;
  late Rx<DateTime> lastMenstrualDate;
  late Pregnant pregnantData1;
  late DateTime deliveryDate1;
  late DateTime lastMenstrualDate1;
  var loading = false.obs;
  late QuestionRepositoryImpl questionRepositoryImpl;

  late LocalPreferences localDataSource;

  @override
  Future<void> onInit() async {
    super.onInit();
    pregnantData1 = Get.arguments['pregnantData'] as Pregnant;
    deliveryDate1 = Get.arguments['deliveryDate'] as DateTime;
    lastMenstrualDate1 = Get.arguments['lastMenstrualDate'] as DateTime;
    pregnantData = pregnantData1.obs;
    deliveryDate = deliveryDate1.obs;
    lastMenstrualDate = deliveryDate1.obs;

    localDataSource = LocalPreferences(
        await SharedPreferences.getInstance(),
    );
    questionRepositoryImpl = QuestionRepositoryImpl(
    remoteDataSource: QuestionRemoteDataSourceImpl(),
    localDataSource: localDataSource,
    networkInfo: NetworkInfoImpl(
    DataConnectionChecker(),
    ),
    );
  }



  int getRemainingDays() {
    DateTime today = DateTime.now();
    Duration difference = deliveryDate.value.difference(today);
    return difference.inDays;
  }


  Future<void> onFollowUp(BuildContext context) async {
      try {
        loading.value = true;

        final tokenPair = await localDataSource.getUserSession();
        if (!tokenPair.first) {
          Deviceutils.showToastMessage('User session has expired, please login', context);
          return;
        }
        final token = tokenPair.second;

        final formattedLastMenstrualDate = DateFormat('yyyy-MM-dd').format(lastMenstrualDate.value);
        final formattedDeliveryDate = DateFormat('yyyy-MM-dd').format(deliveryDate.value);




        final savePregnancyResult =  await eitherFailureOrsendPregnetInfo(token,  PregnantInfoParams(firstVisitDate:formattedLastMenstrualDate, expectedDeliveryDate: formattedDeliveryDate ));
        if (savePregnancyResult != true) {
          Deviceutils.showToastMessage('Failed to save pregnancy details. Please try again.', context);
          return;
        }

        final pregnancyInfoSaved = await eitherFailureOrGetPregnaces(token);

        if (!pregnancyInfoSaved) {
          Deviceutils.showToastMessage('An error occurred. Please try again.', context);
          return;
        }


        // Sync Health Status

        final syncHealthResult = await eitherFailureOrSyncHealth(token, PregnantInfoParams(firstVisitDate:formattedLastMenstrualDate, expectedDeliveryDate: formattedDeliveryDate ));
        if (syncHealthResult != true) {
          Deviceutils.showToastMessage('Failed to sync health status. Please try again.', context);
          return;
        }

        // Fetch and Save Patient Info
        final patientInfoSaved =  await eitherFailureOrGetPatient(token);
        if (patientInfoSaved != true) {
          Deviceutils.showToastMessage('Failed to save pregnancy details. Please try again.', context);
          return;
        }
        if (!patientInfoSaved) {
          Deviceutils.showToastMessage('An error occurred. Please try again.', context);
          return;
        }


        // Navigate to Next Screen
        // _navigationService.navigateToChooseBabyView();
        print(" Navigate to Next Screen");
      } catch (error) {
        Deviceutils.showToastMessage('An error occurred. Please try again.', context);
      } finally {
        loading.value = false;
      }
    }





  Future<bool> eitherFailureOrGetPregnaces(token) async {
    loading.value = true;

    final failureOrOrGetPregnaces = await GetPregneces(
     questionRepository: questionRepositoryImpl,
    ).call(token: token);

    return await failureOrOrGetPregnaces.fold(
          (Failure newFailure) async {
        return false;
      },
          (GetPregnancyResultModel getPregnancyResultModel) async {


        final pregnancyInfoSaved = await localDataSource.savePregnancyInfo(
            getPregnancyResultModel );

        return pregnancyInfoSaved;

      },
    );
  }


  Future<bool> eitherFailureOrsendPregnetInfo(String token, PregnantInfoParams pregnantInfoParams) async {
    loading.value = true;

    final failureOrsendPregnetInfo = await SendPregnetInfo(
      questionRepository: questionRepositoryImpl,
    ).call(token: token, pregnantInfoParams: pregnantInfoParams);


    return await failureOrsendPregnetInfo.fold(
          (Failure newFailure) async {
        return false;
      },
          (SyncHealthStatusResultModel syncHealthStatusResultModel) async {
        // final pregnancyInfoSaved =
        // await localDataSource.savePregnancyInfo(getPregnancyResponse);
        return syncHealthStatusResultModel.result??false;
      },
    );
  }




  Future<bool> eitherFailureOrSyncHealth(String token, PregnantInfoParams pregnantInfoParams) async {
    loading.value = true;

    final failureOrSyncHealth= await SyncHealth(
      questionRepository: questionRepositoryImpl,
    ).call(token: token, pregnantInfoParams: pregnantInfoParams);

    return await failureOrSyncHealth.fold(
          (Failure newFailure) async {
        return false;
      },
          (SyncHealthStatusResultModel syncHealthStatusResultModel) async {
            return syncHealthStatusResultModel.result??false;

      },
    );
  }


  Future<bool> eitherFailureOrGetPatient(String token) async {
    loading.value = true;

    final failureOrSyncHealth= await GetPatient(
      questionRepository: questionRepositoryImpl,
    ).call(token: token);

    return await failureOrSyncHealth.fold(
          (Failure newFailure) async {
        return false;
      },
          (PatientInfoResultModel patientInfoResultModel) async {
        final patientInfoSaved =
        await localDataSource.savePatientInfo(patientInfoResultModel);
        return patientInfoSaved;
      },
    );
  }

  }

