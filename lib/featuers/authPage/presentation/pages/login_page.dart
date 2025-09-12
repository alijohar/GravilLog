import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../controllers/login_controller.dart';
import '../widgets/custom_text_fiels.dart';
import '../widgets/loader.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
                          AppStrings.loginToYourAccount.tr,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.fontWeight,
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            text: '${AppStrings.dontHaveAccount.tr}\t',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 14 * 0.08,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.fontWeight,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: AppStrings.signUp.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 14 * 0.04,
                                  color: ColorManager.azure,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.fontWeight,
                                ),
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
                      ssoUI(controller)
                    ],
                    if (Platform.isIOS && controller.ssoEnabledIos) ...[
                      ssoUI(controller)
                    ],

                    const SizedBox(height: 50),

                    // Email & Password
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.email.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(letterSpacing: 14 * 0.02),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: controller.emailController,
                            hintText: AppStrings.email.tr,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => controller.hasEmail.value = value.isNotEmpty,
                          ),


                          const SizedBox(height: 16),
                          Text(
                            AppStrings.password.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(letterSpacing: 14 * 0.02),
                          ),
                          const SizedBox(height: 10),
                          Obx(() => CustomTextFormField(
                            controller: controller.passwordController,
                            hintText: AppStrings.password.tr,
                            obscureText: controller.isObscured.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscured.value ? Icons.visibility_off : Icons.visibility,
                                color: ColorManager.royalBlue,
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
                                "${AppStrings.forgotPassword.tr}?",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 14 * 0.04,
                                  color: ColorManager.azure,
                                  fontWeight: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.fontWeight,
                                ),
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
                    backgroundColor: ColorManager.pinkSherbet,
                    shape: const BeveledRectangleBorder(),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: controller.loading.value
                      ? const Loader(duration: Duration(milliseconds: 600))
                      : Text(
                    AppStrings.continueBtn.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.fontWeight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ssoUI(LoginController controller) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => controller.facebookLogin(),
                child: const Icon(
                  Icons.facebook_outlined,
                  size: 50,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => controller.googleLogin(),
                child: SvgPicture.asset(ImageAssets.googleSvg),

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
            const Expanded(
              child: Divider(thickness: 1, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                AppStrings.or.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.fontWeight,
                  color: Colors.black,
                ),
              ),
            ),
            const Expanded(
              child: Divider(thickness: 1, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

