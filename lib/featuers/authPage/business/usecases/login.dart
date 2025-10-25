import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../data/models/auth_result_model.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepository;

  Login({required this.authRepository});

  Future<Either<Failure, AuthResultModel>> call({
    required AuthParams authParams,
  }) async {
    return await authRepository.login(authParams: authParams);
  }
}
