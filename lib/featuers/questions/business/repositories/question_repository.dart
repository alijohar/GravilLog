import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../authPage/data/models/get_pregnancy_result_model.dart';
import '../../../authPage/data/models/patient_info_result_model.dart';
import '../../data/models/sync_health_status_result_model.dart';
import '../entities/pregnant_info_entity.dart';


abstract class QuestionRepository {


  Future<Either<Failure, SyncHealthStatusResultModel>> sendPregnetInfo({required PregnantInfoParams pregnantInfoParams, required String token});
 Future<Either<Failure, GetPregnancyResultModel>> getPregneces({ required String token});

 Future<Either<Failure, SyncHealthStatusResultModel>> syncHealth({required PregnantInfoParams pregnantInfoParams,
   required String token});

  Future<Either<Failure, PatientInfoResultModel>>  getPatient({required String token});

}
