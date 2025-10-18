import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gravilog_2025/core/resources/app_text_styles.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key,
      required this.onPressed,this.borderColor,
      required this.text,
      this.backGroundColor,this.elevation,
      this.textStyle});
  final void Function() onPressed;
  final String text;
  final Color? backGroundColor;
  final TextStyle? textStyle;
  final double? elevation;
  final Color ?borderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey.shade50,
          elevation: elevation??0,
          side: BorderSide(color:borderColor?? ColorManager.transparent),
          backgroundColor: backGroundColor ?? context.theme.primaryColor),
      child: Text(
        text.tr,
        style: textStyle ?? AppTextStyles.kTextStyle16ButtonText800,
      ),
    );
  }
}
