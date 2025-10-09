import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/binding/main_binding.dart';
import 'core/local_preferences/local_preferences.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/constants_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/translations.dart';
import 'featuers/authPage/presentation/controllers/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize LocalPreferences before app starts
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(LocalPreferences(sharedPreferences), permanent: true);
  Get.put(LanguageController());

  runApp(const MyApp());
}

class MyApp extends GetView<LanguageController> {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set your design size (width, height)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            title: 'MEMO',
            debugShowCheckedModeBanner: false,
            initialBinding: MainBindings(),
            theme: AppTheme.lightTheme(controller.currentLanguage.value),
            locale: Locale(controller.currentLanguage.value), // Default language
            fallbackLocale: const Locale(AppConstants.englishLanguage, 'US'),
            supportedLocales: const [
              Locale(AppConstants.englishLanguage, 'US'),
              Locale(AppConstants.arabicLanguage, 'SA'),
            ],
            localizationsDelegates: const [
              CountryLocalizations.delegate, // For country_picker
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            translations: Translation(),
            unknownRoute: GetPage(
                name: '/notfound', page: () => RouteGenerator.unDefinedPage()),
            getPages: RouteGenerator.getPages(),
            initialRoute: Routes.splashRoute,
          ),
        );
      },
    );
  }
}
