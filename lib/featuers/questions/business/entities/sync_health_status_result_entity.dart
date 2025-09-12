class SyncHealthStatusResultEntity {
  SyncHealthStatusResultEntity({
    required this.result,
  });

  final bool? result;

  SyncHealthStatusResultEntity copyWith({
    bool? result,
  }) {
    return SyncHealthStatusResultEntity(
      result: result ?? this.result,
    );
  }

  factory SyncHealthStatusResultEntity.fromJson(Map<String, dynamic> json){
    return SyncHealthStatusResultEntity(
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