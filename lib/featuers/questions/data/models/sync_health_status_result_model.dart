import '../../business/entities/sync_health_status_result_entity.dart';

class SyncHealthStatusResultModel extends SyncHealthStatusResultEntity {
  SyncHealthStatusResultModel({
    required bool? result,
  }) : super(result: result);


  SyncHealthStatusResultModel copyWith({
    bool? result,
  }) {
    return SyncHealthStatusResultModel(
      result: result ?? this.result,
    );
  }

  factory SyncHealthStatusResultModel.fromJson(Map<String, dynamic> json){
    return SyncHealthStatusResultModel(
      result: json["result"],
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
  };

  @override
  String toString(){
    return "$result, ";
  }
}