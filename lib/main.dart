import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/binding/main_binding.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp(languageCode: "en"));
}

class MyApp extends StatefulWidget {
  final String languageCode;

  const MyApp({super.key, required this.languageCode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MEMO',
      debugShowCheckedModeBanner: false,
      initialBinding: MainBindings(),
      theme: AppTheme.lightTheme,
      locale: Locale(widget.languageCode), // Default language
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
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
    );
  }
}
