final class AuthException implements Exception {
  final String errorMessage;
  const AuthException({required this.errorMessage});
}
