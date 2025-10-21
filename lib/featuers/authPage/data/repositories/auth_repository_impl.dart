import 'dart:developer';

import 'package:dartz/dartz.dart';
import '/featuers/authPage/errors/auth_exception.dart';
import '/featuers/authPage/data/models/get_pregnancy_result_model.dart';
import '/featuers/authPage/data/models/patient_info_result_model.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../business/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_result_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalPreferences localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthResultModel>> login(
          {required AuthParams authParams}) async =>
      await ExceptionsHandler.baseHelperMethod(() async {
        await networkInfo.isConnected;
        final authResultModel =
            await remoteDataSource.login(authParams: authParams);
        //?now we need to check if there is any error happened
        //? to early throw it from here
        if (authResultModel.hasError) {
          throw AuthException(errorMessage: authResultModel.error!);
        }

        return authResultModel;
      });

  @override
  Future<Either<Failure, AuthResultModel>> signup(
      {required AuthParams authParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        AuthResultModel remoteAuth =
            await remoteDataSource.signup(authParams: authParams);

        return Right(remoteAuth);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      } on OtherFailure catch (e) {
        return Left(OtherFailure(errorMessage: e.errorMessage));
      } catch (e) {
        return Left(OtherFailure(errorMessage: 'This is an exception $e'));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Connection'));
    }
  }

  @override
  Future<Either<Failure, PatientInfoResultModel>> getPatientInfo(
      {required AuthParams authParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        PatientInfoResultModel patientInfoResultModel =
            await remoteDataSource.getPatientInfo(authParams: authParams);

        return Right(patientInfoResultModel);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      } on OtherFailure catch (e) {
        return Left(OtherFailure(errorMessage: e.errorMessage));
      } catch (e) {
        return Left(OtherFailure(errorMessage: 'This is an exception $e'));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Connection'));
    }
  }

  @override
  Future<Either<Failure, GetPregnancyResultModel>> getPregnancyInfo(
      {required AuthParams authParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        GetPregnancyResultModel getPregnancyResponse =
            await remoteDataSource.getPregnacyInfo(authParams: authParams);

        return Right(getPregnancyResponse);
      } on ServerException catch (e, stack) {
        log('$stack');
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      } on OtherFailure catch (e, stack) {
        log('$stack');
        return Left(OtherFailure(errorMessage: e.errorMessage));
      } catch (e, stack) {
        log('$stack');
        return Left(OtherFailure(errorMessage: 'This is an exception $e'));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Connection'));
    }
  }

  @override
  Future<Either<Failure, AuthResultModel>> resetPassword(
      {required AuthParams authParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        AuthResultModel remoteAuth =
            await remoteDataSource.resetPassword(authParams: authParams);
        return Right(remoteAuth);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      } on OtherFailure catch (e) {
        return Left(OtherFailure(errorMessage: e.errorMessage));
      } catch (e) {
        return Left(OtherFailure(errorMessage: 'This is an exception $e'));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'No Connection'));
    }
  }
}
