import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

class AuthElevatedButton extends StatelessWidget {
  const AuthElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.transparent,
        backgroundColor: context.pinkSherbet,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: context.pinkSherbet),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: child,
    );
  }
}
