import 'package:gravilog_2025/featuers/authPage/business/entities/pregnancy_entity.dart';

class PregnancyModel extends PregnancyEntity {
  PregnancyModel({
    required int? pregnancyId,
    required int? patientId,
    required num? pregnancyNumber,
    required DateTime? firstVisitDate,
    required String? expectedDeliveryPlace,
    required DateTime? expectedDeliveryDate,
    required String? importantNotes,
    required num? expectedDeliveryMode,
  }) : super(pregnancyId: pregnancyId, patientId:patientId, pregnancyNumber: pregnancyNumber, firstVisitDate: firstVisitDate, expectedDeliveryPlace: expectedDeliveryPlace, expectedDeliveryDate: expectedDeliveryDate, importantNotes: importantNotes, expectedDeliveryMode: expectedDeliveryMode);



  PregnancyModel copyWith({
    int? pregnancyId,
    int? patientId,
    num? pregnancyNumber,
    DateTime? firstVisitDate,
    String? expectedDeliveryPlace,
    DateTime? expectedDeliveryDate,
    String? importantNotes,
    num? expectedDeliveryMode,
  }) {
    return PregnancyModel(
      pregnancyId: pregnancyId ?? this.pregnancyId,
      patientId: patientId ?? this.patientId,
      pregnancyNumber: pregnancyNumber ?? this.pregnancyNumber,
      firstVisitDate: firstVisitDate ?? this.firstVisitDate,
      expectedDeliveryPlace: expectedDeliveryPlace ?? this.expectedDeliveryPlace,
      expectedDeliveryDate: expectedDeliveryDate ?? this.expectedDeliveryDate,
      importantNotes: importantNotes ?? this.importantNotes,
      expectedDeliveryMode: expectedDeliveryMode ?? this.expectedDeliveryMode,
    );
  }

  factory PregnancyModel.fromJson(Map<String, dynamic> json){
    return PregnancyModel(
      pregnancyId: json["pregnancy_id"],
      patientId: json["patient_id"],
      pregnancyNumber: json["pregnancy_number"],
      firstVisitDate: DateTime.tryParse(json["first_visit_date"] ?? ""),
      expectedDeliveryPlace: json["expected_delivery_place"],
      expectedDeliveryDate: DateTime.tryParse(json["expected_delivery_date"] ?? ""),
      importantNotes: json["important_notes"],
      expectedDeliveryMode: json["expected_delivery_mode"],
    );
  }

  Map<String, dynamic> toJson() => {
    "pregnancy_id": pregnancyId,
    "patient_id": patientId,
    "pregnancy_number": pregnancyNumber,
    "first_visit_date": firstVisitDate?.toIso8601String(),
    "expected_delivery_place": expectedDeliveryPlace,
    "expected_delivery_date": expectedDeliveryDate?.toIso8601String(),
    "important_notes": importantNotes,
    "expected_delivery_mode": expectedDeliveryMode,
  };

  @override
  String toString(){
    return "$pregnancyId, $patientId, $pregnancyNumber, $firstVisitDate, $expectedDeliveryPlace, $expectedDeliveryDate, $importantNotes, $expectedDeliveryMode, ";
  }
}