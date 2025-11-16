import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.textAlign=TextAlign.start,
    this.hintStyle,
    this.contentPadding,
    this.fillColor,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:contentPadding??const EdgeInsets.symmetric(horizontal: 12),
        hintText: hintText,
        hintStyle: hintStyle??
        TextStyle(
          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
          fontSize: 14,
          letterSpacing: 14 * 0.02,
        ),
        filled: true,
        fillColor:fillColor?? const Color(0xFFF8F7F7),
        border: InputBorder.none,
        suffixIcon: suffixIcon,
      ),
      textAlign: textAlign,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
