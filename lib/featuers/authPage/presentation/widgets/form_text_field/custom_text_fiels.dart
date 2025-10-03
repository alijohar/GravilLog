import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
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
          constraints: BoxConstraints.loose(const Size(double.infinity, 50)),
          hintText: hintText,
          hintStyle: context.textStyles.bodyMedium!.copyWith(
              letterSpacing: 14 * 0.02,
              color: context.textTertiary,
              fontWeight: FontWeight.w600),
          filled: true,
          fillColor: context.surfaceColor,
          border: _baseBorder(),
          enabledBorder: _baseBorder(),
          focusedBorder: _baseBorder(borderColor: context.textTertiary),
          errorBorder: _baseBorder(borderColor: context.errorColor),
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: prefixIcon,
                ),
          prefixIconConstraints: BoxConstraints.tight(const Size(40, 40)),
          suffixIcon: suffixIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: suffixIcon,
                ),
          suffixIconConstraints: BoxConstraints.tight(const Size(40, 40))),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}

InputBorder _baseBorder({Color? borderColor}) {
  return OutlineInputBorder(
      borderSide: borderColor == null
          ? BorderSide.none
          : BorderSide(color: borderColor, width: .5),
      borderRadius: const BorderRadius.all(Radius.circular(8)));
}
