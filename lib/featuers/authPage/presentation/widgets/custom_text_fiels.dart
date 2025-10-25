import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.textStyle14labelMedium600hints,
        filled: true,
        fillColor: const Color(0xFFF8F7F7),
        border: InputBorder.none,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
