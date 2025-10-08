import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/assets_manager.dart';

///pregnant image in auth pages
class AuthLeadingWidget extends StatelessWidget {
  const AuthLeadingWidget({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ClipOval(
            child: Image.asset(
              ImageAssets.authLeadingImage,
              height: 62,
              width: 62,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: context.textStyles.displayLarge!.copyWith(
            color: context.pinkSherbet,
          ),
        ),
      ],
    );
  }
}
