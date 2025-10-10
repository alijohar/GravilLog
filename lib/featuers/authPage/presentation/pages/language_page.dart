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
import '../../../../core/resources/app_text_styles.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackGround(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                HeightSpace(100.h),
            Image.asset(
              ImageAssets.pregnantIcon,
              height: 65.h,
              width: 65.w,
            ),
            HeightSpace(40.h),
            Text(
              "chooseLanguage".tr,
                style: AppTextStyles.kTextStyle20Pink700,
            ),
            HeightSpace(8.h),
            Text(
              "selectLanguage".tr,
              style: AppTextStyles.textStyle16bodyLarge400,
              textAlign: TextAlign.center,
            ),
            const HeightSpace(24),
            Obx(
                  () => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: ColorManager.pinkSherbet)),
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
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
            HeightSpace(35.h),
            Text(
              "changeLater".tr,
              style:AppTextStyles.kTextStyle16Grey400,
            ),
            HeightSpace(80.h),
            AppElevatedButton(
                onPressed: () {
                  controller.onContinue();
                },
                text: 'continue'),
            HeightSpace(40.h),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
