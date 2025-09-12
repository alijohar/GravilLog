import 'dart:ffi';

import 'package:dio/dio.dart';

class BaseResModel<T> {
  dynamic result;
  String? jsonrpc;
  int? id;
  BaseResModel(
      {required this.result,
        required this.jsonrpc,
        required this.id,
       });
  BaseResModel.fromJson(Response baseJson) {
  Map<String, dynamic> json = baseJson.data;
  jsonrpc = json['jsonrpc'];
  id = json['id'];
  result = json["result"];
  }
}







