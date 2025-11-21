import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/constants_manager.dart';

class AppTextStyles{
  static get baseFont {
    final langCode = Get.locale?.languageCode ?? AppConstants.englishLanguage;
    final fontFamily = langCode == AppConstants.englishLanguage
        ? AppConstants.englishFontFamily
        : AppConstants.arabicFontFamily;
    return TextStyle(fontFamily: fontFamily);
  }


  //font weight 800
  static get kTextStyleHead20Weight800 => baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
  );
  static get kTextStyle16ButtonText800 => baseFont.copyWith(
    color: ColorManager.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
  );
  static get kTextStyle14Black800 => baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
  );


  //font weight 700
  static get kTextStyle24displayLarge700 => baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static get kTextStyleHead16Weight700 => baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static get kTextStyle20Pink700 => baseFont.copyWith(
    color: ColorManager.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );


  //font weight 600
  static get kTextStyle14primary600 =>  baseFont.copyWith(
    color: ColorManager.primary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  ); static get kTextStyle14black600 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle20displayMedium600 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle18displaySmall600 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle22black600 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );
  static get textStyle16headlineLarge600=>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );



  //font weight 500
  static get textStyle14headlineMedium500 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static get textStyle12darkGrey500 =>  baseFont.copyWith(
    color: ColorManager.blackGrey,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );


  //font weight 400
  static get textStyle14bodyMedium400=>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static get textStyle16bodyLarge400 =>  baseFont.copyWith(
    color: ColorManager.textPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static get textStyle12bodySmall400 => baseFont.copyWith(
    color: ColorManager.textSecondary,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static get kTextStyle16Grey400 =>  baseFont.copyWith(
    color: ColorManager.darkGrey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static get kTextStyle14MediumGrey400 =>  baseFont.copyWith(
    color: ColorManager.mediumGrey,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );





}