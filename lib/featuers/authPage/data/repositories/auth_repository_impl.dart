import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/local_preferences/local_preferences.dart';
import '../../business/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

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
  Future<Either<Failure, AuthModel>> login(
      {required AuthParams authParams}) async {

    if (await networkInfo.isConnected!) {
        try {
          AuthModel remoteAuth =
              await remoteDataSource.login(authParams: authParams);

          // localDataSource.cacheAuth(authToCache: remoteAuth);

          return Right(remoteAuth);
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
