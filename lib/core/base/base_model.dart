import 'dart:ffi';

import 'package:dio/dio.dart';

class BaseResModel<T> {
  dynamic data;
  String? message;
  int? statusCode;
  int? errorCode;
  BaseResModel(
      {required this.data,
        required this.message,
        required this.errorCode,
        required this.statusCode});
  BaseResModel.fromJson(Response baseJson) {
  Map<String, dynamic> json = baseJson.data;
    errorCode = json['error_code'];
    statusCode = baseJson.statusCode;
    data = json["data"];
    message = json["message"].toString() ?? '';
  }
}



class BaseSocketResModel<T> {
  dynamic data;
  bool? success;
  String? message;

  BaseSocketResModel({required this.data,
    required this.success,
  });

  BaseSocketResModel.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    success = json["success"] ?? false;
    message = json["message"] ?? "";
  }
}




