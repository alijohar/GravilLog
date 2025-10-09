import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';

class AppTextStyles{


  static get kTextStyle24displayLarge700 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static get textStyle20displayMedium600 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle18displaySmall600 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle16headlineLarge600=> TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle14bodyMedium400=> TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static get textStyle16bodyLarge400 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static get textStyle14headlineMedium500 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static get textStyle12bodySmall400 =>TextStyle(
    color: ColorManager.textSecondary,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static get textStyle15Weight600 => TextStyle(
    color: ColorManager.textPrimary,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );


}