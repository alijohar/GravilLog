import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

import '../../../../core/resources/assets_manager.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_text_fiels.dart';
import '../widgets/loader.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return context.gradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "login_to_your_account".tr,
                          style: context.textStyles.displayLarge,
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: '${"dont_have_account".tr}\t',
                            style: context.textStyles.bodySmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: "sign_up".tr,
                                style: context.textStyles.labelLarge,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => controller.navigateToSignup(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // SSO
                    if (Platform.isAndroid && controller.ssoEnabledAndroid) ...[
                      ssoUI(controller, context)
                    ],
                    if (Platform.isIOS && controller.ssoEnabledIos) ...[
                      ssoUI(controller, context)
                    ],

                    const SizedBox(height: 50),

                    // Email & Password
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "email".tr,
                            style: context.textStyles.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: controller.emailController,
                            hintText: "email".tr,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => controller.hasEmail.value = value.isNotEmpty,
                          ),


                          const SizedBox(height: 16),
                          Text(
                            "password".tr,
                            style: context.textStyles.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          Obx(() => CustomTextFormField(
                            controller: controller.passwordController,
                            hintText: "password".tr,
                            obscureText: controller.isObscured.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscured.value ? Icons.visibility_off : Icons.visibility,
                                color: context.royalBlue,
                              ),
                              onPressed: () => controller.isObscured.toggle(),
                            ),
                            onChanged: (value) => controller.hasPassword.value = value.isNotEmpty,
                          )),
                          // Obx(

                          const SizedBox(height: 20),
                          Center(
                            child: TextButton(
                              onPressed: () => controller.navigateToForgotPassword(),
                              child: Text(
                                "${"forgot_password".tr}?",
                                style: context.textStyles.labelLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Login Button
            Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Obx(
                    () => ElevatedButton(
                  onPressed: controller.hasEmail.value &&
                      controller.hasPassword.value
                      ? () => controller.patientLoginWithEmail()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.pinkSherbet,
                    shape: const BeveledRectangleBorder(),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: controller.loading.value
                      ? const Loader(duration: Duration(milliseconds: 600))
                      : Text(
                    "continue".tr,
                    style: context.textStyles.labelLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ssoUI(LoginController controller, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => controller.facebookLogin(),
                child: Icon(
                  Icons.facebook_outlined,
                  size: 50,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => controller.googleLogin(),
                child: SvgPicture.asset(IconAssets.googleIcon),

              ),
              if (Platform.isIOS) ...[
                const SizedBox(width: 30),
                InkWell(
                  onTap: () => controller.appleLogin(),
                  child: SvgPicture.asset(
                    'assets/icons/ic_apple.svg',
                    height: 36,
                    width: 36,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: Divider(thickness: 1, color: context.onSurfaceColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "or".tr,
                style: context.textStyles.bodyMedium,
              ),
            ),
            Expanded(
              child: Divider(thickness: 1, color: context.onSurfaceColor),
            ),
          ],
        ),
      ],
    );
  }
}

