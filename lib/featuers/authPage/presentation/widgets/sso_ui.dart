import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

import '../../../../core/resources/assets_manager.dart';
import 'social_media_icon_button.dart';

class SSOUi extends StatelessWidget {
  const SSOUi({
    super.key,
    required this.facebookOnPressed,
    required this.googleOnPressed,
    this.appleOnPressed,
  });
  final void Function()? googleOnPressed;
  final void Function()? facebookOnPressed;
  final void Function()? appleOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: context.textSecondary,
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "or_continuo_with".tr,
                style: context.textStyles.bodyLarge!
                    .copyWith(color: context.textSecondary),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: context.textSecondary,
                indent: 20,
                endIndent: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIconButton(
                onTap: facebookOnPressed,
                child: const Icon(
                  Icons.facebook_outlined,
                  size: 35,
                  color: Color(0xff1877F2),
                ),
              ),
              const SizedBox(width: 30),
              SocialMediaIconButton(
                onTap: googleOnPressed,
                child: SvgPicture.asset(
                  IconAssets.googleIcon,
                  height: 30,
                  width: 30,
                ),
              ),
              if (Platform.isIOS) ...[
                const SizedBox(width: 30),
                SocialMediaIconButton(
                  onTap: appleOnPressed,
                  child: SvgPicture.asset(
                    'assets/icons/ic_apple.svg',
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
