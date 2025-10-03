import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/reset_password_controller.dart';

import '../../../../core/resources/assets_manager.dart';
import '../widgets/auth_elevated_button.dart';
import '../widgets/form_text_field/custom_text_fiels.dart';
import '../widgets/form_text_field/text_field_icon.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final _controller = ResetPasswordController();

  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
        appBar: AppBar(
          backgroundColor: context.gradientStart,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Text(
              'create_new_password'.tr,
              textAlign: TextAlign.center,
              style: context.textStyles.displayLarge!.copyWith(
                color: context.pinkSherbet,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'must_use_different_password'.tr,
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
                        Obx(() => CustomTextFormField(
                              controller: _controller.passwordController,
                              hintText: "password".tr,
                              obscureText: _controller.isObscured.value,
                              prefixIcon: const TextFieldIconImage(
                                  assetImage: IconAssets.lockIcon),
                              suffixIcon: GestureDetector(
                                onTap: () => _controller.isObscured.toggle(),
                                child: TextFieldIconImage(
                                  assetImage: _controller.isObscured.value
                                      ? IconAssets.eyeIcon
                                      : IconAssets.eyeSlashIcon,
                                ),
                              ),
                              onChanged: (value) => _controller
                                  .hasPassword.value = value.isNotEmpty,
                            )),
                        const SizedBox(height: 10),
                        Obx(() => CustomTextFormField(
                              controller: _controller.confirmPasswordController,
                              hintText: "confirm_password".tr,
                              obscureText: _controller.isObscured.value,
                              prefixIcon: const TextFieldIconImage(
                                  assetImage: IconAssets.lockIcon),
                              suffixIcon: GestureDetector(
                                onTap: () => _controller.isObscured.toggle(),
                                child: TextFieldIconImage(
                                  assetImage: _controller.isObscured.value
                                      ? IconAssets.eyeIcon
                                      : IconAssets.eyeSlashIcon,
                                ),
                              ),
                              onChanged: (value) => _controller
                                  .hasConfirmPassword.value = value.isNotEmpty,
                            )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => AuthElevatedButton(
                  onPressed: _controller.canContinuo
                      ? () => _controller.showDoneDialog(context)
                      : null,
                  child: Text(
                    "continue".tr,
                    style: context.textStyles.bodyLarge!.copyWith(
                        color: _controller.canContinuo
                            ? context.surfaceColor
                            : context.pinkSherbet,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ],
        )));
  }
}
