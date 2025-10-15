import '../../business/entities/auth_result_entity.dart';

class AuthResultModel extends AuthResultEntity {
  AuthResultModel({
    //?token my returned as bool in case login failed
    required dynamic token,
    required String? error,
    required String? result,
  }) : super(token: token, error: error, result: result);

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
