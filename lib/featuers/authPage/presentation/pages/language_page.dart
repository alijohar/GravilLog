import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/language_controller.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: context.gradientScaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Obx(() => Text(
                            languageController.currentLanguage.value == 'en'
                                ? 'Choose the language'
                                : 'اختر اللغة',
                            style: context.textStyles.displayLarge,
                          ),
                          ),
                          const SizedBox(height: 80),
                          Container(
                            height: 290,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 130,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'EN',
                                          style: context.textStyles.displayLarge?.copyWith(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 60),
                                    Obx(() => GestureDetector(
                                      onTap: () {
                                        languageController.currentLanguage.value = 'en';
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: languageController.currentLanguage.value == 'en'
                                              ? ColorManager.royalBlue
                                              : ColorManager.grey,
                                        ),
                                        child: Center(
                                          child: languageController.currentLanguage.value == 'en'
                                              ? Icon(Icons.check, color: context.onPrimaryColor)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    )                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorManager.peachyPink,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 23, left: 2),
                                          child: Text(
                                            'ع',
                                            style: context.textStyles.displayLarge?.copyWith(fontSize: 40),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 60),
                                    Obx(() => GestureDetector(
                                      onTap: () {
                                        // Beispiel: Sprache ändern
                                        languageController.currentLanguage.value = 'ar';
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: languageController.currentLanguage.value == 'ar'
                                              ? ColorManager.royalBlue
                                              : ColorManager.grey,
                                        ),
                                        child: Center(
                                          child: languageController.currentLanguage.value == 'ar'
                                              ? Icon(Icons.check, color: context.onPrimaryColor)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    )                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // The ElevatedButton is moved outside the Expanded and is placed at the bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () => languageController.onContinue() ,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.royalBlue,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        languageController.currentLanguage.value == 'en'
                            ? 'Continue'
                            : 'استمرار',
                        style: context.textStyles.headlineLarge?.copyWith(color: context.onPrimaryColor),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
