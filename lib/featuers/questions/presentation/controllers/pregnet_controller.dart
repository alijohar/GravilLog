import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../core/resources/routes_manager.dart';
import '../../data/models/pregnant_info_model.dart';

class PregnantQuestionController extends GetxController {
  // Rx variable to hold pregnant state
  var isPregnant = Pregnant.Is_Pregnant.obs;
  var isNotPregnant = Pregnant.Not_Pregnant.obs;

  // Loading state if needed
  var loading = false.obs;

  void startupLogic() {
    // Any startup logic
  }

  void setPregnant(Pregnant value) {
    isPregnant.value = value;
  }

  void onNotPregnant() {
    if (kDebugMode) {
      print("Pregnant: ${isNotPregnant.value}");
    }
    Get.toNamed(Routes.menstrualPeriodRoute, arguments: isNotPregnant.value);
  }

  void onConfirm() {
    if (kDebugMode) {
      print("Pregnant: ${isPregnant.value}");
    }
    Get.toNamed(Routes.duePeriodRoute, arguments: isPregnant.value);
  }
}

// class TemplateController extends GetxController {
//   QuestionEntity? template;
//   Failure? failure;
//
//   void eitherFailureOrTemplate() async {
//     QuestionRepositoryImpl repository = QuestionRepositoryImpl(
//       remoteDataSource: TemplateRemoteDataSourceImpl(),
//       localDataSource: TemplateLocalDataSourceImpl(
//         sharedPreferences: await SharedPreferences.getInstance(),
//       ),
//       networkInfo: NetworkInfoImpl(
//         DataConnectionChecker(),
//       ),
//     );
//
//     final failureOrTemplate = await GetTemplate(templateRepository: repository).call(
//       templateParams: MessageParams(),
//     );
//
//     failureOrTemplate.fold(
//       (Failure newFailure) {
//         template = null;
//         failure = newFailure;
//       },
//       (QuestionEntity newTemplate) {
//         template = newTemplate;
//         failure = null;
//       },
//     );
//   }
// }
