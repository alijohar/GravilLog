import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/auth_result_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuth({required AuthResultModel? authToCache});
  Future<AuthResultModel> getLastAuth();
}

const cachedAuth = 'CACHED_AUTH';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AuthResultModel> getLastAuth() {
    final jsonString = sharedPreferences.getString(cachedAuth);

    if (jsonString != null) {
      return Future.value(AuthResultModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAuth({required AuthResultModel? authToCache}) async {
    if (authToCache != null) {
      sharedPreferences.setString(
        cachedAuth,
        json.encode(
          authToCache.toJson(),
        ),
      );
    } else {
      throw CacheException();
    }
  }
}
