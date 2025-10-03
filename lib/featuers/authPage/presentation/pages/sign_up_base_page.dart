import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/signup_controller.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/widgets.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/sso_ui.dart';

class SignUpBasePage extends StatelessWidget {
  const SignUpBasePage({
    super.key,
    required this.leadingLabel,
    required this.formBody,
    required this.button,
    required this.controller,
  });
  final String leadingLabel;
  final Widget formBody;
  final Widget button;
  final SignupController controller;
  @override
  Widget build(BuildContext context) {
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
              AuthLeadingWidget(
                label: leadingLabel,
              ),
              const SizedBox(
                height: 20,
              ),
              formBody,
              button,
              // SSO
              const SizedBox(height: 20),
              if (Platform.isAndroid && controller.ssoEnabledAndroid) ...[
                SSOUi(
                  googleOnPressed: () => controller.googleSignUp(),
                  facebookOnPressed: () => controller.facebookSignUp,
                ),
              ],
              if (Platform.isIOS && controller.ssoEnabledIos) ...[
                SSOUi(
                  googleOnPressed: () => controller.googleSignUp(),
                  facebookOnPressed: () => controller.facebookSignUp,
                  appleOnPressed: () => controller.appleSignUp(),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already_have_an_account".tr,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                        color: const Color(0xff030303),
                        fontWeight: FontWeight.normal),
                  ),
                  CustomTextButton(
                    btnText: "sing_in_here".tr,
                    textUnderLine: false,
                    textColor: context.pinkSherbet,
                    fontSize: 14,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
