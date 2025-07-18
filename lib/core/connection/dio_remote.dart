import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/strings_manager.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  late Dio _dio;

  factory DioSingleton() {
    return _instance;
  }

  DioSingleton._internal() {
    // Initialize Dio with your preferred configurations

      _dio = Dio(BaseOptions(
        baseUrl: AppStrings.API,
        connectTimeout: Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
           'Authorization': "Bearer token"
        },

      ));
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 120));





  }

  Dio get dioInstance => _dio;
}
