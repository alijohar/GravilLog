import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

class SocialMediaIconButton extends StatelessWidget {
  const SocialMediaIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
