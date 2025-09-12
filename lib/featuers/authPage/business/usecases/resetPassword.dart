import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/auth_result_model.dart';
import '../entities/auth_result_entity.dart';
import '../repositories/auth_repository.dart';

class Resetpassword {
  final AuthRepository authRepository;

  Resetpassword({required this.authRepository});

  Future<Either<Failure, AuthResultModel>> call({
    required AuthParams authParams,
  }) async {
    return await authRepository.resetPassword(authParams: authParams);
  }
}