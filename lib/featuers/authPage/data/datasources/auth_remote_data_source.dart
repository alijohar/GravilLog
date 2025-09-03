
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/base/base_model.dart';
import '../../../../core/connection/dio_remote.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required AuthParams authParams});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<AuthModel> login({required AuthParams authParams}) async {
    try {
      print("loginnnnnnnnn");
      final baseResponse = await DioSingleton().dioInstance.post(
        '${AppConstants.BASE_URL}',

        data: {
          "jsonrpc": "2.0",
          "method": AppConstants.LOGIN,
          "params": {
            "patient": authParams.patient,
            "email": authParams.email,
            "password": authParams.password,
          },
          "id": 0,
        },
      );
      print("the base respone is ${baseResponse}");

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
