
import 'package:gravilog_2025/featuers/authPage/data/models/pregnancy_model.dart';

import '../../business/entities/get_pregnancy_result_entity.dart';

class GetPregnancyResultModel  extends GetPregnancyResultEntity{
  GetPregnancyResultModel({
    required List<PregnancyModel> pregnancies,
  }) : super(pregnancies: pregnancies);


  GetPregnancyResultModel copyWith({
    List<PregnancyModel>? pregnancies,
  }) {
    return GetPregnancyResultModel(
      pregnancies: pregnancies ?? this.pregnancies,
    );
  }

  factory GetPregnancyResultModel.fromJson(Map<String, dynamic> json){
    return GetPregnancyResultModel(
      pregnancies: json["pregnancies"] == null ? [] : List<PregnancyModel>.from(json["pregnancies"]!.map((x) => PregnancyModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "pregnancies": pregnancies.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$pregnancies, ";
  }
}

