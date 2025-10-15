class AuthResultEntity {
  final dynamic token;
  final String? error;
  final String? result;
  AuthResultEntity({
    required this.token,
    required this.error,
    required this.result,
  });
}
