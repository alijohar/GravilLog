class HealthStatusEntity {
  HealthStatusEntity({
    required this.patientId,
    required this.height,
    required this.heightUnit,
    required this.weight,
    required this.weightUnit,
    required this.gravida,
    required this.parity,
    required this.note,
    required this.firstDayLastPeriod,
    required this.regular,
    required this.sure,
    required this.expectedDeliveryDate,
    required this.bloodPressure,
    required this.diabetes,
    required this.previousCs,
    required this.previousSurgery,
    required this.familyBloodPressure,
    required this.twins,
    required this.herediaryDiseases,
    required this.familyDiabetes,
    required this.consanguinityId,
    required this.otherDiseases,
    required this.bloodTypeId,
    required this.firstBaby,
    required this.isPregnant,
    required this.husbandRelation
  });

  final int? patientId;
  final num? height;
  final String? heightUnit;
  final num? weight;
  final String? weightUnit;
  final int? gravida;
  final num? parity;
  final String? note;
  final dynamic firstDayLastPeriod;
  final num? regular;
  final num? sure;
  final dynamic expectedDeliveryDate;
  final num? bloodPressure;
  final num? diabetes;
  final String? previousCs;
  final String? previousSurgery;
  final num? familyBloodPressure;
  final num? twins;
  final String? herediaryDiseases;
  final num? familyDiabetes;
  final int? consanguinityId;
  final String? otherDiseases;
  final int? bloodTypeId;
  final num? firstBaby;
  final num? isPregnant;
  final String? husbandRelation;


}
