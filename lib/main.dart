import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/binding/main_binding.dart';
import 'core/local_preferences/local_preferences.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/routes_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'core/resources/translations.dart';
import 'featuers/authPage/presentation/controllers/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final sharedPrefs = await SharedPreferences.getInstance();
  Get.put(LocalPreferences(sharedPrefs), permanent: true);
  Get.put(LanguageController());

  runApp(const MyApp());
}

class MyApp extends GetView<LanguageController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("================${controller.currentLanguage.value}===========");
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Obx(()
        => GetMaterialApp(
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
          initialRoute: Routes.languageRoute,
        ),
      ),
    );
  }
}
