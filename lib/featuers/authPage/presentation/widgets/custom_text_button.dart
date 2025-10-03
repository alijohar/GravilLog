import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.btnText,
    this.textUnderLine = true,
    this.fontSize = 10,
    this.textColor = const Color(0xffFFC436),
    this.icon,
    required this.onPressed,
  });

  final String btnText;
  final bool textUnderLine;
  final Color textColor;
  final double fontSize;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        overlayColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
        shadowColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
        surfaceTintColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      icon: icon == null ? null : Icon(icon),
      label: Text(
        ' $btnText',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              decoration: textUnderLine ? TextDecoration.underline : null,
              decorationColor: textColor,
              decorationThickness: 2,
            ),
      ),
    );
  }
}
