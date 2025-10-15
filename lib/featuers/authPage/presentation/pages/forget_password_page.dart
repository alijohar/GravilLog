import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/resources/app_theme.dart';
import '/featuers/authPage/presentation/widgets/auth_elevated_button.dart';
import '/featuers/authPage/presentation/widgets/form_text_field/custom_text_fiels.dart';
import '/featuers/authPage/presentation/widgets/widgets.dart';

import '../../../../core/resources/assets_manager.dart';
import '../controllers/forget_password_controller.dart';
import '../widgets/form_text_field/text_field_icon.dart';
import '../widgets/loader.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.find();

    return context.gradientScaffold(
      appBar: AppBar(
        backgroundColor: context.gradientStart,
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthLeadingWidget(
              label: "forget_your_password".tr,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'we_will_send_reset_link'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            controller: controller.emailController,
                            hintText: "email".tr,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const TextFieldIconImage(
                                assetImage: IconAssets.mailIcon),
                            onChanged: (value) =>
                                controller.hasEmail.value = value.isNotEmpty,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(
                () => AuthElevatedButton(
                  onPressed: controller.hasEmail.value
                      ? () => controller.resetPassword(context)
                      : null,
                  child: controller.loading.value
                      ? Loader(
                          color: context.surfaceColor,
                        )
                      : Text(
                          "send_reset_link".tr,
                          style: context.textStyles.bodyLarge!.copyWith(
                              color: controller.hasEmail.value
                                  ? context.surfaceColor
                                  : context.pinkSherbet,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
