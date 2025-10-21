///in case of success we will get the token
///
///in case of failure we will get an error
class AuthResultEntity {
  final String? token;
  final String? error;
  final String? result;
  const AuthResultEntity({
    required this.token,
    required this.error,
    required this.result,
  });
}
