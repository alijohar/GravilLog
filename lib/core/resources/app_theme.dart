import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'constants_manager.dart';

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
        secondary: ColorManager.secondary,
        
        // Surface Colors
        surface: ColorManager.cardBackground,
        surfaceContainerHighest: ColorManager.lightBackground,
        background: ColorManager.backgroundColor,
        
        // Text Colors
        onPrimary: ColorManager.white,
        onSecondary: ColorManager.white,
        onSurface: ColorManager.textPrimary,
        onBackground: ColorManager.textPrimary,
        
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
          foregroundColor: ColorManager.azure,
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
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: ColorManager.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: ColorManager.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
  
  // Custom color extensions for easy access
  static ColorScheme colors(BuildContext context) => Theme.of(context).colorScheme;
  static TextTheme textStyles(BuildContext context) => Theme.of(context).textTheme;
}

// Extension for easy access to custom colors and text styles
extension AppColors on BuildContext {
  // Text Styles
  TextTheme get textStyles => Theme.of(this).textTheme;
  
  // Primary Colors
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  
  // Surface Colors
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  
  // Text Colors
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get textPrimary => ColorManager.textPrimary;
  Color get textSecondary => ColorManager.textSecondary;
  Color get textTertiary => ColorManager.textTertiary;
  
  // Status Colors
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  
  // Custom App Colors (still accessible via ColorManager)
  Color get pinkSherbet => ColorManager.pinkSherbet;
  Color get royalBlue => ColorManager.royalBlue;
  Color get azure => ColorManager.azure;
  Color get hotPink => ColorManager.hotPink;
  Color get mintCream => ColorManager.mintCream;
  Color get peachyPink => ColorManager.peachyPink;
  Color get skyBlue => ColorManager.skyBlue;
  
  // Grey Colors
  Color get darkGrey => ColorManager.darkGrey;
  Color get grey => ColorManager.grey;
  Color get lightGrey => ColorManager.lightGrey;
  Color get lightGreyShade200 => ColorManager.lightGreyShade200;
  
  // Status Colors
  Color get successColor => ColorManager.success;
  Color get warningColor => ColorManager.warning;
  
  // Additional Material Colors
  Color get outlineColor => Theme.of(this).colorScheme.outline;
  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;
  Color get surfaceVariant => Theme.of(this).colorScheme.surfaceVariant;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  
  // Gradient Colors
  Color get gradientStart => ColorManager.gradientStart;
  Color get gradientEnd => ColorManager.gradientEnd;
  
  // Background Gradient
  LinearGradient get backgroundGradient => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorManager.gradientStart, // #FDE5EF
      ColorManager.gradientEnd,   // #DCE9EF
    ],
  );
  
  // Helper method to create gradient scaffold
  Widget gradientScaffold({
    required Widget body,
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Widget? drawer,
    Widget? endDrawer,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
  }) {
    return Scaffold(
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
      endDrawer: endDrawer,
    );
  }
}
