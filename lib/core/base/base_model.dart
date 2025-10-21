// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

///in response we will get result as map, this map contains data we will need
class BaseResModel<T> {
  ///the most important part of our response it holds the data
  dynamic result;
  String? jsonrpc;
  int? id;
  BaseResModel({
    required this.result,
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
