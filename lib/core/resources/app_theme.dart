import 'package:flutter/material.dart';
import 'app_text_styles.dart';
import 'color_manager.dart';
part 'package:gravilog_2025/core/resources/extensions.dart';
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
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
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: ColorManager.textPrimary,
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.pinkSherbet,
          foregroundColor: ColorManager.white,
          elevation: 0,
          shape: const BeveledRectangleBorder(),
          minimumSize: const Size(double.infinity, 50),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorManager.lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorManager.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorManager.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorManager.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: const TextStyle(
          color: ColorManager.textTertiary,
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: ColorManager.textSecondary,
          fontSize: 14,
        ),
      ),
      
      // Card Theme
      //TODO: you must to return it as it was
      cardTheme: CardThemeData(
        color: ColorManager.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
      ),
      
        // Scaffold Background - Use transparent for gradient
        scaffoldBackgroundColor: Colors.transparent,
      
      // Text Theme
      //first font size second font fontWeight
      textTheme: const TextTheme(
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

