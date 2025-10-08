import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/signup_controller.dart';

import '../widgets/sso_ui.dart';
import '../widgets/text_with_button_widget.dart';
import '../widgets/widgets.dart';

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
            child: Column(
          children: [
            Expanded(
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
                        googleOnPressed: () => controller.googleLogin(),
                        facebookOnPressed: () => controller.facebookLogin(),
                      ),
                    ],
                    if (Platform.isIOS && controller.ssoEnabledIos) ...[
                      SSOUi(
                        googleOnPressed: () => controller.googleLogin(),
                        facebookOnPressed: () => controller.facebookLogin(),
                        appleOnPressed: () => controller.appleLogin(),
                      ),
                    ],
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            TextWithButtonWidget(
              buttonAction: () => controller.navigateToLogin(),
              buttonText: "sing_in_here".tr,
              leadingText: "already_have_an_account".tr,
            ),
          ],
        )));
  }
}
