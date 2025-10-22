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
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const HeightSpace(169),
              Image.asset(
                ImageAssets.pregnantIcon,
                height: 62.sp,
                width: 62.sp,
                fit: BoxFit.contain,
              ),
              const HeightSpace(40),
              Text(
                "chooseLanguage".tr,
                style: AppTextStyles.kTextStyle20Pink700,
              ),
              const HeightSpace(8),
              Text(
                "selectLanguage".tr,
                style: AppTextStyles.textStyle16bodyLarge400,
                textAlign: TextAlign.center,
              ),
              const HeightSpace(24),
              Obx(
                () => Container(
                    width: 1.sw,
                    height: 68.h,
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
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'English',
                              style: AppTextStyles.textStyle18labelLarge500,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            alignment: Alignment.centerRight,
                            child: Text(
                              'العربية',
                              style: AppTextStyles.textStyle18labelLarge500,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const HeightSpace(40),
              Text(
                "changeLater".tr,
                style: AppTextStyles.kTextStyle16Grey400,
              ),
            ]),
          ),
        )),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: AppElevatedButton(
            onPressed: () {
              controller.onContinue();
            },
            text: 'continue'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
