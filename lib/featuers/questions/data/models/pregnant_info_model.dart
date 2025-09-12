
import '../../../../core/resources/strings_manager.dart';
import '../../business/entities/pregnant_info_entity.dart';

class PregnantInfoModel extends PregnetInfoEntity {
  const PregnantInfoModel({
    required String pregnancyId,
    required String pregnancyNumber,
    required String firstVisitDate,
    required String expectedDeliveryPlace,
    required String expectedDeliveryDate,
    required String expectedDeliveryMode,
    required String importantNotes,

  }) : super(
    pregnancyId: pregnancyId,
    pregnancyNumber: pregnancyNumber,
    firstVisitDate: firstVisitDate,
    expectedDeliveryPlace: expectedDeliveryPlace,
    expectedDeliveryDate: expectedDeliveryDate,
    expectedDeliveryMode: expectedDeliveryMode,
    importantNotes: importantNotes,
  );

  factory PregnantInfoModel.fromJson(Map<String, dynamic> json) {
    return PregnantInfoModel(


      pregnancyId: json["pregnancy_id"],
      pregnancyNumber: json["pregnancy_number"],
      firstVisitDate: json["first_visit_date"],
      expectedDeliveryPlace: json["expected_delivery_place"],
      expectedDeliveryDate: json["expected_delivery_date"],
      expectedDeliveryMode: json["expected_delivery_mode"],
      importantNotes: json["important_notes"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    "pregnancy_id" :pregnancyId,
    "pregnancy_number" :pregnancyNumber,
    "first_visit_date" :firstVisitDate,
    "expected_delivery_place" :expectedDeliveryPlace,
    "expected_delivery_date" :expectedDeliveryDate,
    "expected_delivery_mode" :expectedDeliveryMode,
    "important_notes" :importantNotes,    };
  }
}
enum Pregnant { Is_Pregnant, Not_Pregnant }

class Pair<F, S> {
  final F first;
  final S second;

  Pair(this.first, this.second);
}
