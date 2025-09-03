import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        hintStyle: TextStyle(
          fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
          fontSize: 14,
          letterSpacing: 14 * 0.02,
        ),
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
