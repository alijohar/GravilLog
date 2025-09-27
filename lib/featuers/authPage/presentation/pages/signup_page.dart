import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/app_theme.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_text_fiels.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find();

    return context.gradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "create_free_account".tr,
                        style: context.textStyles.displayLarge,
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "${"already_have_an_account".tr}\t",
                          style: context.textStyles.bodyMedium?.copyWith(color: context.secondaryColor),
                          children: [
                            TextSpan(
                              text: "sign_up".tr,
                              style: context.textStyles.bodyMedium?.copyWith(color: context.primaryColor),
                              recognizer: TapGestureRecognizer()..onTap = controller.navigateToSignup,
                            ),
                          ],
                        ),
                      ),

                      if (Platform.isAndroid) ssoUI(controller, context),
                      if (Platform.isIOS) ssoUI(controller, context),

                      const SizedBox(height: 30),

                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("email".tr),
                            const SizedBox(height: 10),

                            CustomTextFormField(
                              controller: controller.emailController,
                              hintText: "email".tr,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => controller.hasEmail.value = value.isNotEmpty,
                            ),
                            const SizedBox(height: 16),

                            Text("password".tr),
                            const SizedBox(height: 10),
                            Obx(() => CustomTextFormField(
                              controller: controller.passwordController,
                              hintText: "password".tr,
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
                            const SizedBox(height: 30),

                            Text("phone_number".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 54.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54.0,

                                      child: TextFormField(
                                        controller: controller.countryCodeController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: context.surfaceVariant,
                                          border: InputBorder.none,
                                          hintText: "+1",
                                          counter: SizedBox.shrink(), // Hide the character counter

                                        ),
                                        maxLength: 4,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]{0,3}')),
                                        ],
                                        onChanged: (value) {
                                          // Ensure the input starts with "+"
                                          if (value.isNotEmpty && !value.startsWith('+')) {
                                            // si.countryCodeController.text = '+' + value;
                                            // model.countryCodeController.selection = TextSelection.fromPosition(TextPosition(offset: model.countryCodeController.text.length));
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 4,
                                    child:
                                    CustomTextFormField(
                                      controller:  controller.phoneController,
                                      hintText: "phone_number".tr,
                                      keyboardType: TextInputType.phone,
                                    )


                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),
                            Obx(() => Row(
                              children: [
                                GestureDetector(
                                  onTap: () => controller.isChecked.value =
                                  !controller.isChecked.value,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.isChecked.value
                                          ? context.primaryColor
                                          : context.surfaceColor,
                                      border: Border.all(
                                        color: controller.isChecked.value
                                            ? context.primaryColor
                                            : context.onSurfaceColor,
                                      ),
                                    ),
                                    child: controller.isChecked.value
                                        ? Icon(Icons.check,
                                        size: 16, color: context.onPrimaryColor)
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: context.textStyles.bodyMedium?.copyWith(color: context.secondaryColor),
                                      children: [
                                        TextSpan(
                                            text:
                                            "${"accept_the".tr}\t"),
                                        TextSpan(
                                          text:
                                          "${"terms_of_use".tr}\t",
                                          style: context.textStyles.bodyMedium?.copyWith(color: context.primaryColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = controller.navigateToTermsOfUseView,
                                        ),
                                        TextSpan(
                                            text:
                                            "\t${"and".tr}\t"),
                                        TextSpan(
                                          text: "privacy_policy".tr,
                                          style: context.textStyles.bodyMedium?.copyWith(color: context.primaryColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = controller.navigateToPrivacyPolicyView,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => ElevatedButton(
                onPressed: controller.hasEmail.value &&
                    controller.hasPassword.value &&
                    controller.isChecked.value
                    ? () => controller.patientSignupWithEmail(context)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: controller.loading.value
                    ? CircularProgressIndicator(color: context.onPrimaryColor)
                    : Text(
                  "continue".tr,
                  style: context.textStyles.bodyMedium?.copyWith(color: context.onPrimaryColor),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget ssoUI(SignupController controller, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async => print("facebook"),
              // await controller.oauthService.facebookLogin(
              //   setLoading: controller.setLoading,
              // ),
              child: Icon(Icons.facebook_outlined, size: 50, color: context.primaryColor),
            ),
            const SizedBox(width: 30),
            InkWell(
              onTap: () async =>
                 print("majd"),
              // await controller.oauthService.googleLogin(setLoading: controller.setLoading),
              child: SvgPicture.asset('assets/icons/ic_google.svg'),
            ),
            if (Platform.isIOS) ...[
              const SizedBox(width: 30),
              InkWell(
                onTap: () async =>
    print("loginn"),
                // await controller.oauthService.appleLogin(setLoading: controller.setLoading),
                child: SvgPicture.asset('assets/icons/ic_apple.svg', height: 36, width: 36),
              ),
            ]
          ],
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: context.onSurfaceColor)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("OR", style: context.textStyles.bodyMedium?.copyWith(color: context.onSurfaceColor)),
            ),
            Expanded(child: Divider(thickness: 1, color: context.onSurfaceColor)),
          ],
        ),
      ],
    );
  }
}
