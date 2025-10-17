import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';

import '../controllers/pregnet_controller.dart';

class PregnantQuestionView extends StatelessWidget {
  const PregnantQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final PregnantQuestionController controller = Get.find();
    controller.startupLogic();

    return Column(
      spacing: 24.h,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Text(
          "are_you_pregnant".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
        ),
        Text(
          "pregnant_question_hint".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: ColorManager.darkGrey,
              ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.h,
          children: [
            ElevatedButton(
              onPressed: () {
                // controller.setPregnant(Pregnant.Is_Pregnant);
                // controller.onConfirm();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(1.sw, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                backgroundColor: ColorManager.hotPink,
              ),
              child: Text(
                "yes".tr,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: ColorManager.white,
                    ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                //controller.setPregnant(Pregnant.Not_Pregnant);
                // controller.onNotPregnant();
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(1.sw, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                side: const BorderSide(color: ColorManager.hotPink),
              ),
              child: Text(
                "no".tr,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: ColorManager.hotPink,
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
