import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/sign_up_base_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/auth_elevated_button.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/custom_text_button.dart';
import '../../../../core/resources/assets_manager.dart';

import '../controllers/signup_controller.dart';
import '../widgets/check_box_tile/check_box_tile.dart';
import '../widgets/form_text_field/custom_text_fiels.dart';
import '../widgets/form_text_field/text_field_icon.dart';

class SignupPasswordsView extends StatelessWidget {
  const SignupPasswordsView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find();

    return SignUpBasePage(
      leadingLabel: 'ready_to_begin'.tr,
      formBody: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => CustomTextFormField(
                  controller: controller.passwordController,
                  hintText: "password".tr,
                  obscureText: controller.isObscured.value,
                  prefixIcon:
                      const TextFieldIconImage(assetImage: IconAssets.lockIcon),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isObscured.toggle(),
                    child: TextFieldIconImage(
                      assetImage: controller.isObscured.value
                          ? IconAssets.eyeIcon
                          : IconAssets.eyeSlashIcon,
                    ),
                  ),
                  onChanged: (value) =>
                      controller.hasPassword.value = value.isNotEmpty,
                )),
            const SizedBox(height: 10),
            Text(
              'password_restricts'.tr,
              style: context.textStyles.bodySmall,
            ),
            const SizedBox(height: 16),
            Obx(() => CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: "confirm_password".tr,
                  obscureText: controller.isObscured.value,
                  prefixIcon:
                      const TextFieldIconImage(assetImage: IconAssets.lockIcon),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isObscured.toggle(),
                    child: TextFieldIconImage(
                      assetImage: controller.isObscured.value
                          ? IconAssets.eyeIcon
                          : IconAssets.eyeSlashIcon,
                    ),
                  ),
                  onChanged: (value) =>
                      controller.passwordConfirmed.value = value.isNotEmpty,
                )),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircularCheckboxTile(
                  onChanged: (value) => controller.isChecked.value = value,
                  label: "i_accept_to".tr,
                ),
                CustomTextButton(
                    btnText: 'terms_and_conditions'.tr,
                    fontSize: 14,
                    onPressed: () => controller.navigateToTermsOfUseView),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      button: Obx(() => AuthElevatedButton(
          onPressed: controller.canCreateAccount ? () {} : null,
          child: Text(
            "sign_up_now".tr,
            style: context.textStyles.bodyLarge!.copyWith(
                color: controller.canCreateAccount
                    ? context.surfaceColor
                    : context.pinkSherbet,
                fontWeight: FontWeight.bold),
          ))),
      controller: controller,
    );
  }
}
