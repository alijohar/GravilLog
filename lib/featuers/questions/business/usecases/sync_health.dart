import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/sync_health_status_result_model.dart';
import '../repositories/question_repository.dart';

class SyncHealth {
  final QuestionRepository questionRepository;

  SyncHealth({required this.questionRepository});



  Future<Either<Failure, SyncHealthStatusResultModel>> call({
    required PregnantInfoParams pregnantInfoParams, required String token }) async {
    return await questionRepository.syncHealth(pregnantInfoParams: pregnantInfoParams, token: token);
  }
}