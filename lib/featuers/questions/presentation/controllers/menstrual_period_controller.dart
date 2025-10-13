import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/routes_manager.dart';
import '../../data/models/pregnant_info_model.dart';


//Note: all logic for menstrual period for tasting
class MenstrualPeriodController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedMenstrualCycle = 28.obs; // Defaultwert
  var selectedValue = RxnString();
  late Rx<Pregnant> pregnantData;

  @override
  void onInit() {
    super.onInit();

    // Initialize reactive variable with value from arguments
    pregnantData = (Get.arguments as Pregnant).obs;
  }

  final List<int> menstrualLength = List.generate(15, (index) => 21 + index);


  void onCalculate({ required Pregnant pregnant, required DateTime menstrualFirstDay,required int menstrualCycleLength }) {
    print("Periods day: $menstrualFirstDay, Periods Length: $menstrualCycleLength");
    if (pregnant == Pregnant.Is_Pregnant) {
      final result = _calculateEstimatedDeliveryDate(menstrualFirstDay, menstrualCycleLength);
      Get.toNamed(
        Routes.expectDeliveryRoute,
        arguments: {
          'pregnantData': pregnantData.value,
          'deliveryDate': result,
          'lastMenstrualDate': menstrualFirstDay,
        },
      );
    } else {
      final result = _calculateOvulation(menstrualFirstDay, menstrualCycleLength);
      // _navigationService.navigateToTimePregnantView(pregnantData: pregnant, from: result.first, to: result.second);
    }
  }

  Pair<String, String> _calculateOvulation(DateTime menstrualFirstDay, int menstrualCycleLength) {
    int ovulationDay = menstrualCycleLength - 14;
    DateTime ovulationDate = menstrualFirstDay.add(Duration(days: ovulationDay));

    DateTime fertileStart = ovulationDate.subtract(Duration(days: 5));
    DateTime fertileEnd = ovulationDate.add(Duration(days: 1));

    String formattedFertileStart = '${fertileStart.day}/${fertileStart.month}';
    String formattedFertileEnd = '${fertileEnd.day}/${fertileEnd.month}';

    final output = "$formattedFertileStart $formattedFertileEnd";
    // log(output);
    return Pair(formattedFertileStart, formattedFertileEnd);
  }

  DateTime _calculateEstimatedDeliveryDate(DateTime lmp, int cycleLength) {
    DateTime deliveryDate = lmp.add(Duration(days: 365)); // 1 year later
    deliveryDate = DateTime(deliveryDate.year, deliveryDate.month - 3, deliveryDate.day);
    deliveryDate = deliveryDate.add(Duration(days: 7));
    int cycleDifference = cycleLength - 28; // Calculate the difference from 28 days
    deliveryDate = deliveryDate.add(Duration(days: cycleDifference));
    // log(deliveryDate.toLocal().toString());
    return deliveryDate;
  }
}
