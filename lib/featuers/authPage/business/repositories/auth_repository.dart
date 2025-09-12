import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/auth_result_model.dart';
import '../../data/models/get_pregnancy_result_model.dart';
import '../../data/models/patient_info_result_model.dart';
import '../entities/auth_result_entity.dart';


abstract class AuthRepository {
  Future<Either<Failure, AuthResultModel>> login({
    required AuthParams authParams,
  });
  Future<Either<Failure, AuthResultModel>> signup({
    required AuthParams authParams,
  });
  Future<Either<Failure, GetPregnancyResultModel>> getPregnacyInfo({
    required AuthParams authParams,
  });
  Future<Either<Failure, PatientInfoResultModel>> getPatientInfo({
    required AuthParams authParams,
  });
  Future<Either<Failure, AuthResultModel>> resetPassword({
    required AuthParams authParams,
  });

}
