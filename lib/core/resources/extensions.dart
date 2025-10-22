part of 'package:gravilog_2025/core/resources/app_theme.dart';

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
  Color get backgroundColor => Theme.of(this).colorScheme.surface;

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
          ColorManager.gradientEnd, // #DCE9EF
        ],
      );

  // Scondary Gradient
  LinearGradient get secondaryGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorManager.skyPinkLight, // #FDE5EF
          ColorManager.skyBlueLight, // #DCE9EF
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

  // Helper method to create secondary gradient scaffold
  Widget secondaryGradientScaffold({
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
          gradient: secondaryGradient,
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
