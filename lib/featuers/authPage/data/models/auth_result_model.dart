import '../../business/entities/auth_result_entity.dart';

class AuthResultModel extends AuthResultEntity {
  const AuthResultModel({
    required super.token,
    required super.error,
    required super.result,
  });

  bool get hasError => error != null;

  AuthResultModel copyWith({
    String? token,
    String? error,
    String? result,
  }) {
    return AuthResultModel(
      token: token ?? this.token,
      error: error ?? this.error,
      result: result ?? this.result,
    );
  }

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      token: json["token"],
      error: json["error"],
      result: json["result"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
        "result": result,
      };

  @override
  String toString() {
    return "$token, $error, ";
  }
}
