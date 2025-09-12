import 'package:gravilog_2025/featuers/authPage/business/entities/patient_info_result_entity.dart';
import 'package:gravilog_2025/featuers/authPage/data/models/result_patient_model.dart';

class PatientInfoResultModel extends PatientInfoResultEntity {

  PatientInfoResultModel({
    required ResultPatientModel? patient,
  }) : super(patient: patient);


  PatientInfoResultModel copyWith({
    ResultPatientModel? patient,
  }) {
    return PatientInfoResultModel(
      patient: patient ?? this.patient,
    );
  }

  factory PatientInfoResultModel.fromJson(Map<String, dynamic> json){
    return PatientInfoResultModel(
      patient: json["patient"] == null ? null : ResultPatientModel.fromJson(json["patient"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "patient": patient?.toJson(),
  };

  @override
  String toString(){
    return "$patient, ";
  }
}


