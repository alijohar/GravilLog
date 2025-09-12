import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../authPage/data/models/patient_info_result_model.dart';
import '../repositories/question_repository.dart';


class GetPatient {
final QuestionRepository questionRepository;

GetPatient({required this.questionRepository});



Future<Either<Failure, PatientInfoResultModel>> call({
required String token }) async {
return await questionRepository.getPatient( token: token );
}
}