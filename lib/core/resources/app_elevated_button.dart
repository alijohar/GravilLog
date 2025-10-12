

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gravilog_2025/core/resources/app_text_styles.dart';

class AppElevatedButton extends StatelessWidget {
 const AppElevatedButton({super.key, required this.onPressed, required this.text,this.backGroundColor,this.textStyle});
  final void Function() onPressed;
  final String text;
  final Color ?backGroundColor;
  final TextStyle ?textStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          backGroundColor??context.theme.primaryColor
        ),
        child: Text(
          text.tr,
          style:textStyle??AppTextStyles.kTextStyle16ButtonText800,
        ),
    );
  }
}
