import '../../data/models/health_status_model.dart';
import '../../data/models/patient_model.dart';

class ResultPatientEntity {
  ResultPatientEntity({
    required this.patient,
    required this.healthStatus,
  });

  final PatientModel? patient;
  final HealthStatusModel? healthStatus;


}
