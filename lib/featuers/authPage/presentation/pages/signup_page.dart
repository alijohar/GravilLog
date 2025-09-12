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
import '../../../../core/resources/strings_manager.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_text_fiels.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

      ),
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
                        AppStrings.createFreeAccount.tr,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.alreadyHaveAnAccount.tr}\t",
                          style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),
                          children: [
                            TextSpan(
                              text: AppStrings.signUp.tr,
                              style: const TextStyle(fontSize: 14, color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = controller.navigateToSignup,
                            ),
                          ],
                        ),
                      ),

                      if (Platform.isAndroid) ssoUI(controller),
                      if (Platform.isIOS) ssoUI(controller),

                      const SizedBox(height: 30),

                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.email.tr),
                            const SizedBox(height: 10),

                            CustomTextFormField(
                              controller: controller.emailController,
                              hintText: AppStrings.email.tr,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => controller.hasEmail.value = value.isNotEmpty,
                            ),
                            const SizedBox(height: 16),

                            Text(AppStrings.password.tr),
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
                            const SizedBox(height: 30),

                            Text(AppStrings.phoneNumber.tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 54.0, // Set the height for the entire row
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 54.0, // Set the height for the country code field

                                      child: TextFormField(
                                        controller: controller.countryCodeController,
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFF8F7F7),
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
                                      hintText: AppStrings.phoneNumber.tr,
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
                                          ? Colors.blue
                                          : Colors.white,
                                      border: Border.all(
                                        color: controller.isChecked.value
                                            ? Colors.blue
                                            : Colors.grey.withOpacity(0.3),
                                      ),
                                    ),
                                    child: controller.isChecked.value
                                        ? const Icon(Icons.check,
                                        size: 16, color: Colors.white)
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6), fontSize: 14),
                                      children: [
                                        TextSpan(
                                            text:
                                            "${AppStrings.acceptThe.tr}\t"),
                                        TextSpan(
                                          text:
                                          "${AppStrings.termsOfUse.tr}\t",
                                          style: const TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = controller.navigateToTermsOfUseView,
                                        ),
                                        TextSpan(
                                            text:
                                            "\t${AppStrings.and.tr!}\t"),
                                        TextSpan(
                                          text: AppStrings.privacyPolicy.tr,
                                          style: const TextStyle(color: Colors.blue),
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
                  backgroundColor: Colors.pink,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: controller.loading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                  AppStrings.continueBtn.tr!,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget ssoUI(SignupController controller) {
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
              child: const Icon(Icons.facebook_outlined, size: 50, color: Color(0xFF3B5998)),
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
          children: const [
            Expanded(child: Divider(thickness: 1, color: Colors.black)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("OR", style: TextStyle(color: Colors.black)),
            ),
            Expanded(child: Divider(thickness: 1, color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
