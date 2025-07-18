import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuth({required AuthModel? authToCache});
  Future<AuthModel> getLastAuth();
}

const cachedAuth = 'CACHED_AUTH';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AuthModel> getLastAuth() {
    final jsonString = sharedPreferences.getString(cachedAuth);

    if (jsonString != null) {
      return Future.value(AuthModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAuth({required AuthModel? authToCache}) async {
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
