import '/core/errors/failure.dart';

final class AuthFailure extends Failure {
  final String message;
  AuthFailure(this.message) : super(errorMessage: message);
}
