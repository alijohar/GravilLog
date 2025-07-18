
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/base/base_model.dart';
import '../../../../core/connection/dio_remote.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/strings_manager.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> getAuth({required AuthParams authParams});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<AuthModel> getAuth({required AuthParams authParams}) async {
    try {
      final baseResponse = await DioSingleton().dioInstance.get(
        '${AppStrings.API}/',
        queryParameters: {
          'api_key': 'if needed',
        },
      );
      var response = BaseResModel.fromJson(baseResponse);

      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }
}
