import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/assets_manager.dart';

///pregnant image in auth pages
class AuthLeadingImage extends StatelessWidget {
  const AuthLeadingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipOval(
        child: Image.asset(
          ImageAssets.authLeadingImage,
          height: 62.h,
          width: 62.w,
        ),
      ),
    );
  }
}
