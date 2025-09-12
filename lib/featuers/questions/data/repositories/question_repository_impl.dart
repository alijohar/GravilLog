import 'package:dartz/dartz.dart';
import 'package:gravilog_2025/core/local_preferences/local_preferences.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/get_pregnancy_result_model.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/patient_info_result_model.dart';
import 'package:gravilog_2025/featuers/questions/data/models/sync_health_status_result_model.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/repositories/question_repository.dart';
import '../datasources/question_local_data_source.dart';
import '../datasources/question_remote_data_source.dart';
import '../models/pregnant_info_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource remoteDataSource;
  final LocalPreferences localDataSource;
  final NetworkInfo networkInfo;

  QuestionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetPregnancyResultModel>> getPregneces({required String token}) async {

      if (await networkInfo.isConnected!) {
          try {
            GetPregnancyResultModel getPregnancyResultModel =
                await remoteDataSource.getPregneces(token: token);


            return Right(getPregnancyResultModel);
          } on ServerException {
            return Left(ServerFailure(errorMessage: 'This is a server exception'));
          } on OtherFailure catch (e) {
            return Left(OtherFailure(errorMessage: e.errorMessage));
          } catch(e){
            return Left(OtherFailure(errorMessage: 'This is an exception $e'));
          }
        }
      else{
        return Left(ServerFailure(errorMessage: 'No Connection'));
      }
  }

  @override
  Future<Either<Failure, SyncHealthStatusResultModel>> sendPregnetInfo({required PregnantInfoParams pregnantInfoParams, required String token}) async {

      if (await networkInfo.isConnected!) {
          try {
            SyncHealthStatusResultModel remoteTemplate =
                await remoteDataSource.sendPregnetInfo(pregnantInfoParams: pregnantInfoParams,token: token);


            return Right(remoteTemplate);
          } on ServerException {
            return Left(ServerFailure(errorMessage: 'This is a server exception'));
          } on OtherFailure catch (e) {
            return Left(OtherFailure(errorMessage: e.errorMessage));
          } catch(e){
            return Left(OtherFailure(errorMessage: 'This is an exception $e'));
          }
        }
      else{
        return Left(ServerFailure(errorMessage: 'No Connection'));
      }
  }

  @override
  Future<Either<Failure, SyncHealthStatusResultModel>> syncHealth({required PregnantInfoParams pregnantInfoParams, required String token}) async {

      if (await networkInfo.isConnected!) {
          try {
            SyncHealthStatusResultModel remoteTemplate =
                await remoteDataSource.syncHealth(pregnantInfoParams: pregnantInfoParams,token: token);


            return Right(remoteTemplate);
          } on ServerException {
            return Left(ServerFailure(errorMessage: 'This is a server exception'));
          } on OtherFailure catch (e) {
            return Left(OtherFailure(errorMessage: e.errorMessage));
          } catch(e){
            return Left(OtherFailure(errorMessage: 'This is an exception $e'));
          }
        }
      else{
        return Left(ServerFailure(errorMessage: 'No Connection'));
      }
  }

  @override
  Future<Either<Failure, PatientInfoResultModel>> getPatient({required String token}) async {
    if (await networkInfo.isConnected!) {
      try {
        PatientInfoResultModel patientInfoResultModel =
            await remoteDataSource.getPatient(token: token);


        return Right(patientInfoResultModel);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      } on OtherFailure catch (e) {
        return Left(OtherFailure(errorMessage: e.errorMessage));
      } catch(e){
        return Left(OtherFailure(errorMessage: 'This is an exception $e'));
      }
    }
    else{
      return Left(ServerFailure(errorMessage: 'No Connection'));
    }
  }


}
