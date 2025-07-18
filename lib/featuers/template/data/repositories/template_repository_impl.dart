import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/repositories/template_repository.dart';
import '../datasources/template_local_data_source.dart';
import '../datasources/template_remote_data_source.dart';
import '../models/template_model.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TemplateModel>> getTemplate(
      {required MessageParams templateParams}) async {

    if (await networkInfo.isConnected!) {
        try {
          TemplateModel remoteTemplate =
              await remoteDataSource.getTemplate(templateParams: templateParams);

          localDataSource.cacheTemplate(templateToCache: remoteTemplate);

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
}
