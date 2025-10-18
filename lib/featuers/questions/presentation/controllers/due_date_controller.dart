import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/routes_manager.dart';
import 'package:gravilog_2025/featuers/questions/data/models/pregnant_info_model.dart';

class DueDateController extends GetxController {
  // Initialize the due date with a default value.
  // The value from the image is October 6, 2025.
  var selectedDate = DateTime.now().obs;

  // This page is for users who are already confirmed as pregnant.
  late Rx<Pregnant> pregnantData;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the pregnancy status from the previous page's arguments.
    pregnantData = (Get.arguments as Pregnant).obs;
  }

  /// Navigates to the page where the user can calculate their
  /// due date based on their last menstrual period.
  void onHelpCalculate() {
  
  }

  /// Navigates to the next step in the flow, passing the
  /// selected due date to the summary page.
  void onContinue() {
    Get.toNamed(
      Routes.expectDeliveryRoute,
      arguments: {
        'pregnantData': pregnantData.value,
        'deliveryDate': selectedDate.value,
        // A placeholder is passed for lastMenstrualDate as it's not known in this flow.
        'lastMenstrualDate': DateTime.now(),
      },
    );
  }
}
