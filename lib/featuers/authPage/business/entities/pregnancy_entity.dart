class PregnancyEntity {
  PregnancyEntity({
    required this.pregnancyId,
    required this.patientId,
    required this.pregnancyNumber,
    required this.firstVisitDate,
    required this.expectedDeliveryPlace,
    required this.expectedDeliveryDate,
    required this.importantNotes,
    required this.expectedDeliveryMode,
  });

  final int? pregnancyId;
  final int? patientId;
  final num? pregnancyNumber;
  final DateTime? firstVisitDate;
  final String? expectedDeliveryPlace;
  final DateTime? expectedDeliveryDate;
  final String? importantNotes;
  final num? expectedDeliveryMode;

  }
