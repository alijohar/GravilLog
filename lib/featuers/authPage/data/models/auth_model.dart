
import '../../../../core/resources/strings_manager.dart';
import '../../business/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required String userId,
  }) : super(
    userId: userId,
        );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(

      userId: json[AppStrings.kTemplate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.kTemplate: userId,
    };
  }
}
