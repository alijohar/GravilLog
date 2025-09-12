import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/sync_health_status_result_model.dart';
import '../entities/pregnant_info_entity.dart';
import '../repositories/question_repository.dart';

class SendPregnetInfo {
  final QuestionRepository questionRepository;

  SendPregnetInfo({required this.questionRepository});



  Future<Either<Failure, SyncHealthStatusResultModel>> call({
    required PregnantInfoParams pregnantInfoParams, required String token  }) async {
    return await questionRepository.sendPregnetInfo(pregnantInfoParams:pregnantInfoParams, token: token );
  }
}
