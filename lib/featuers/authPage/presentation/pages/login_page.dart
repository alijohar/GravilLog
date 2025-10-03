import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/check_box_tile/check_box_tile.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/form_text_field/text_field_icon.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/text_with_button_widget.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/widgets.dart';

import '../../../../core/resources/assets_manager.dart';
import '../controllers/login_controller.dart';
import '../widgets/form_text_field/custom_text_fiels.dart';
import '../widgets/loader.dart';
import '../widgets/sso_ui.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return context.gradientScaffold(
      appBar: AppBar(
        backgroundColor: context.gradientStart,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// add auth leading image
              AuthLeadingWidget(
                label: "great_to_see_you_again".tr,
              ),
              const SizedBox(
                height: 20,
              ),
              // Email & Password
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
                    Obx(() => CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: "password".tr,
                          obscureText: controller.isObscured.value,
                          prefixIcon: const TextFieldIconImage(
                              assetImage: IconAssets.lockIcon),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularCheckboxTile(
                          onChanged: (value) {},
                          label: "remember_me".tr,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                controller.navigateToForgotPassword(),
                            child: Text(
                              "forgot_password".tr,
                              style: context.textStyles.labelLarge!.copyWith(
                                  color: context.pinkSherbet,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              // Bottom Login Button
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.hasEmail.value &&
                            controller.hasPassword.value
                        ? () => controller.patientLoginWithEmail()
                        : null,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.transparent,
                      backgroundColor: context.pinkSherbet,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: context.pinkSherbet),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: controller.loading.value
                        ? const Loader(duration: Duration(milliseconds: 600))
                        : Text(
                            "login_now".tr,
                            style: context.textStyles.bodyLarge!.copyWith(
                                color: controller.hasEmail.value &&
                                        controller.hasPassword.value
                                    ? context.surfaceColor
                                    : context.pinkSherbet,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),

              // SSO
              if (Platform.isAndroid && controller.ssoEnabledAndroid) ...[
                SSOUi(
                  googleOnPressed: () => controller.googleLogin(),
                  facebookOnPressed: () => controller.facebookLogin,
                ),
              ],
              if (Platform.isIOS && controller.ssoEnabledIos) ...[
                SSOUi(
                  googleOnPressed: () => controller.googleLogin(),
                  facebookOnPressed: () => controller.facebookLogin,
                  appleOnPressed: () => controller.appleLogin(),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              TextWithButtonWidget(
                buttonAction: () => controller.navigateToSignup(),
                leadingText: "have_no_account".tr,
                buttonText: "sign_up_here".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
