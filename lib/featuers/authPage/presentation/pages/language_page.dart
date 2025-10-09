import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_back_ground.dart';
import 'package:gravilog_2025/core/resources/app_elevated_button.dart';
import 'package:gravilog_2025/core/resources/app_spaces.dart';
import 'package:gravilog_2025/core/resources/assets_manager.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackGround(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const HeightSpace(200),
            Image.asset(
              ImageAssets.pregnantIcon,
              height: 65.h,
              width: 65.w,
            ),
            const HeightSpace(40.h),
            Text(
              "chooseLanguage".tr,
              style: context.textTheme.displayMedium?.copyWith(
                  color: ColorManager.hotPink, fontWeight: FontWeight.w400),
            ),
            const HeightSpace(8),
            Text(
              "selectLanguage".tr,
              style: context.textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const HeightSpace(24),
            Obx(
                  () => Container(
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: ColorManager.pinkSherbet)),
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.currentLanguage.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.currentLanguage.value = value;
                          controller.changeLanguage(value);
                        }
                      },
                      icon: SvgPicture.asset(IconAssets.dropDownIcon),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10.r),
                      items: const [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text('English'),
                        ),
                        DropdownMenuItem(
                          value: 'ar',
                          child: Text('العربية'),
                        ),
                      ],
                    ),
                  )),
            ),
            const HeightSpace(35),
            Text(
              "changeLater".tr,
              style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500, color: ColorManager.darkGrey),
            ),
            const HeightSpace(180),
            AppElevatedButton(
                onPressed: () {
                  controller.onContinue();
                },
                text: 'continue')
          ]),
        ),
      ),
    );
  }
}
