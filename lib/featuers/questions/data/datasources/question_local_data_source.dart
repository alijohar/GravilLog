import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/pregnant_info_model.dart';

abstract class QuestionLocalDataSource {
  Future<void> cacheTemplate({required PregnantInfoModel? templateToCache});
  Future<PregnantInfoModel> getLastTemplate();
}

const cachedTemplate = 'CACHED_TEMPLATE';

class TemplateLocalDataSourceImpl implements QuestionLocalDataSource {
  final SharedPreferences sharedPreferences;

  TemplateLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PregnantInfoModel> getLastTemplate() {
    final jsonString = sharedPreferences.getString(cachedTemplate);

    if (jsonString != null) {
      return Future.value(PregnantInfoModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTemplate({required PregnantInfoModel? templateToCache}) async {
    if (templateToCache != null) {
      sharedPreferences.setString(
        cachedTemplate,
        json.encode(
          templateToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
