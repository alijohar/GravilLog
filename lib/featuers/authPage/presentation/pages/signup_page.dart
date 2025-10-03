import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/pages/sign_up_base_page.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/auth_elevated_button.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/custom_country_code_picker.dart';
import '../../../../core/resources/assets_manager.dart';

import '../controllers/signup_controller.dart';
import '../widgets/form_text_field/custom_text_fiels.dart';
import '../widgets/form_text_field/text_field_icon.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find();

    return SignUpBasePage(
        leadingLabel: 'ready_to_begin'.tr,
        formBody: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "full_name".tr,
                keyboardType: TextInputType.name,
                prefixIcon:
                    const TextFieldIconImage(assetImage: IconAssets.userIcon),
                onChanged: (value) =>
                    controller.hasName.value = value.isNotEmpty,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "email".tr,
                keyboardType: TextInputType.emailAddress,
                prefixIcon:
                    const TextFieldIconImage(assetImage: IconAssets.mailIcon),
                onChanged: (value) =>
                    controller.hasEmail.value = value.isNotEmpty,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CustomCountryCodePicker(onChanged: (country) {})),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: CustomTextFormField(
                          hintText: 'phone_number'.tr,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            controller.hasPhone.value = value.isNotEmpty;
                          },
                          controller: controller.phoneController)),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        button: Obx(() => AuthElevatedButton(
            onPressed: controller.hasEmail.value &&
                    controller.hasName.value &&
                    controller.hasPhone.value
                ? () {}
                : null,
            child: Text(
              "sign_up_now".tr,
              style: context.textStyles.bodyLarge!.copyWith(
                  color:
                      controller.hasEmail.value && controller.hasPassword.value
                          ? context.surfaceColor
                          : context.pinkSherbet,
                  fontWeight: FontWeight.bold),
            ))),
        controller: controller);
  }
}
