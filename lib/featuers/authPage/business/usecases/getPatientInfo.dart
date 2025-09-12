import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/patient_info_result_model.dart';
import '../repositories/auth_repository.dart';

class GetPatientInfo {
  final AuthRepository authRepository;

  GetPatientInfo({required this.authRepository});

  Future<Either<Failure, PatientInfoResultModel>> call({
    required AuthParams authParams,
  }) async {
    return await authRepository.getPatientInfo(authParams: authParams);
  }
}