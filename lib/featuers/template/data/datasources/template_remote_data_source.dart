
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../../../../core/base/base_model.dart';
import '../../../../core/connection/dio_remote.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/resources/strings_manager.dart';
import '../models/template_model.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required MessageParams templateParams});
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {

  @override
  Future<TemplateModel> getTemplate({required MessageParams templateParams}) async {
    try {
      final baseResponse = await DioSingleton().dioInstance.get(
        '${AppStrings.API}/',
        queryParameters: {
          'api_key': 'if needed',
        },
      );
      var response = BaseResModel.fromJson(baseResponse);

      if (response.id == 200) {
        return TemplateModel.fromJson(response.result);
      } else {
        throw ServerException();
      }
    } on Exception catch (e) {
      throw OtherFailure(errorMessage: e.toString());
    }
  }
}
