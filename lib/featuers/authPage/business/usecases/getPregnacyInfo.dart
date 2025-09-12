import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/get_pregnancy_result_model.dart';
import '../entities/auth_result_entity.dart';
import '../repositories/auth_repository.dart';

class GetPregnacyInfo {
  final AuthRepository authRepository;

  GetPregnacyInfo({required this.authRepository});

  Future<Either<Failure, GetPregnancyResultModel>> call({
    required AuthParams authParams,
  }) async {
    return await authRepository.getPregnacyInfo(authParams: authParams);
  }
}