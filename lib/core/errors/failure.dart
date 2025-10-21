import '/core/errors/exceptions.dart';
import '/featuers/authPage/errors/auth_exception.dart';
import '/featuers/authPage/errors/auth_failure.dart';

abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class OtherFailure extends Failure {
  const OtherFailure({required super.errorMessage});
}

class FailureMapper {
  static Failure fromException(Exception e) {
    if (e is ServerException) {
      return ServerFailure(errorMessage: e.message);
    } else if (e is AuthException) {
      return AuthFailure(e.errorMessage);
    } else if (e is CacheException) {
      return CacheFailure(errorMessage: 'cache failure ${e.toString()}');
    } else {
      return const OtherFailure(errorMessage: 'some error happened');
    }
  }
}
