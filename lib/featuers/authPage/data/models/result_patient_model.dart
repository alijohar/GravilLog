import 'package:gravilog_2025/featuers/authPage/data/models/patient_model.dart';

import '../../business/entities/result_patient_entity.dart';
import 'health_status_model.dart';

class ResultPatientModel extends ResultPatientEntity {
  ResultPatientModel({
    required PatientModel?  patient,
    required HealthStatusModel? healthStatus,
  }) : super(patient: patient, healthStatus: healthStatus);


  ResultPatientModel copyWith({
    PatientModel? patient,
    HealthStatusModel? healthStatus,
  }) {
    return ResultPatientModel(
      patient: patient ?? this.patient,
      healthStatus: healthStatus ?? this.healthStatus,
    );
  }

  factory ResultPatientModel.fromJson(Map<String, dynamic> json){
    return ResultPatientModel(
      patient: json["patient"] == null ? null : PatientModel.fromJson(json["patient"]),
      healthStatus: json["health_status"] == null ? null : HealthStatusModel.fromJson(json["health_status"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "patient": patient?.toJson(),
    "health_status": healthStatus?.toJson(),
  };

  @override
  String toString(){
    return "$patient, $healthStatus, ";
  }
}
