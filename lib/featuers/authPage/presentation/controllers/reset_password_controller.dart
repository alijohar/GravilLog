import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/routes_manager.dart';

import '../../../../core/resources/assets_manager.dart';

final class ResetPasswordController extends GetxController {
  final hasPassword = false.obs;
  final hasConfirmPassword = false.obs;
  final isObscured = true.obs;
  bool get canContinuo => hasPassword.value && hasConfirmPassword.value;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  _navigateToLogin() {
    Get.offAllNamed(Routes.loginRoute);
  }

  showDoneDialog(BuildContext context) {
    Deviceutils.showCustomDialog(context,
        title: "check_you_email".tr,
        leadingSvgImagePath: ImageAssets.doneImage,
        bodyText: 'we_sent_reset_link'.tr,
        buttonText: 'back_to_login'.tr,
        isDismissible: false,
        buttonAction: () => _navigateToLogin());
  }
}
