import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

import 'custom_text_button.dart';

class TextWithButtonWidget extends StatelessWidget {
  const TextWithButtonWidget({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.buttonAction,
  });

  final String leadingText;
  final String buttonText;
  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 12,
              color: const Color(0xff030303),
              fontWeight: FontWeight.normal),
        ),
        CustomTextButton(
            btnText: buttonText,
            textUnderLine: false,
            textColor: context.pinkSherbet,
            fontSize: 14,
            onPressed: buttonAction),
      ],
    );
  }
}
