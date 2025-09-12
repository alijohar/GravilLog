import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../authPage/data/models/get_pregnancy_result_model.dart';
import '../repositories/question_repository.dart';

class GetPregneces {
  final QuestionRepository questionRepository;

  GetPregneces({required this.questionRepository});



  Future<Either<Failure, GetPregnancyResultModel>> call({
    required String token }) async {
    return await questionRepository.getPregneces( token: token );
  }
}
