import 'dart:developer';

import 'package:get/get.dart';

final class CheckBoxTileController extends GetxController {
  final RxBool checked = false.obs;

  void changeValue() {
    log('change value1: ${checked.value}');
    checked.value = !checked.value;
    log('change value2: ${checked.value}');
  }
}
