import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
      child: Scaffold(
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
                            style: const TextStyle(
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                              color: Colors.black54, // direkter statt withOpacity(0.6)
                            ),
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
                                        color: ColorManager.paleAqua,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'EN',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'Almarai',
                                            fontWeight: FontWeight.w700,
                                          ),
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
                                              : ColorManager.lightGray,
                                        ),
                                        child: Center(
                                          child: languageController.currentLanguage.value == 'en'
                                              ? const Icon(Icons.check, color: Colors.white)
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
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.w700,
                                            ),
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
                                              : ColorManager.lightGray,
                                        ),
                                        child: Center(
                                          child: languageController.currentLanguage.value == 'ar'
                                              ? const Icon(Icons.check, color: Colors.white)
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
                      backgroundColor: ColorManager.royalBlue,
                      shape: const BeveledRectangleBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      minimumSize: const Size(double.infinity, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        languageController.currentLanguage.value == 'en'
                            ? 'Continue'
                            : 'استمرار',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
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
