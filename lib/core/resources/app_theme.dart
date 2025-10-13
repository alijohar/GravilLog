import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_styles.dart';
import 'color_manager.dart';
import 'constants_manager.dart';

part 'extensions.dart';

class AppTheme {
  static ThemeData  lightTheme(String languageCode) {
    return ThemeData(
      fontFamily:languageCode==AppConstants.englishLanguage?
      AppConstants.englishFontFamily:AppConstants.arabicFontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.primary,
        brightness: Brightness.light,
      ).copyWith(
        // Primary Colors
        primary: ColorManager.primary,
        primaryContainer: ColorManager.primaryLight,

        // Surface Colors
        surface: ColorManager.cardBackground,
        surfaceContainerHighest: ColorManager.lightBackground,

        // Text Colors
        onPrimary: ColorManager.white,
        onSecondary: ColorManager.white,
        onSurface: ColorManager.textPrimary,

        // Status Colors
        error: ColorManager.error,
        onError: ColorManager.white,
        
        // Outline Colors
        outline: ColorManager.lightGrey,
        outlineVariant: ColorManager.lightGreyShade200,
      ),
      
      // App Bar Theme
      appBarTheme:AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle:AppTextStyles.textStyle18displaySmall600,
        iconTheme:const IconThemeData(
          color: ColorManager.textPrimary,
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.pinkSherbet,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
          minimumSize:  Size(double.infinity, 50.h),
          textStyle: AppTextStyles.kTextStyle16ButtonText800
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.primary,
          textStyle:AppTextStyles.textStyle14headlineMedium500
        ),
      ),


      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorManager.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorManager.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorManager.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorManager.error),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        hintStyle:  TextStyle(
          color: ColorManager.textTertiary,
          fontSize: 14.sp,
        ),
        labelStyle:  TextStyle(
          color: ColorManager.textSecondary,
          fontSize: 14.sp,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: ColorManager.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin:  EdgeInsets.all(8.r),
      ),

      // Scaffold Background - Use transparent for gradient
      scaffoldBackgroundColor: Colors.transparent,

      // Text Theme
      //first font size second font fontWeight
      textTheme:  TextTheme(
        displayLarge:AppTextStyles.kTextStyle24displayLarge700,
        displayMedium:AppTextStyles.textStyle20displayMedium600,
        displaySmall: AppTextStyles.textStyle18displaySmall600,
        headlineLarge:AppTextStyles.textStyle16headlineLarge600,
        headlineMedium: AppTextStyles.textStyle14headlineMedium500,
        bodyLarge:AppTextStyles.textStyle16bodyLarge400,
        bodyMedium:AppTextStyles.textStyle14bodyMedium400,
        bodySmall:AppTextStyles.textStyle12bodySmall400,
      ),
    );
  }
  
  // Custom color extensions for easy access
  static ColorScheme colors(BuildContext context) => Theme.of(context).colorScheme;
  static TextTheme textStyles(BuildContext context) => Theme.of(context).textTheme;
}

