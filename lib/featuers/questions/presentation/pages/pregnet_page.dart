import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/featuers/questions/data/models/pregnant_info_model.dart';
import 'package:gravilog_2025/featuers/questions/presentation/widgets/steps_progress_bar.dart';

import '../controllers/pregnet_controller.dart';

class PregnantQuestionView extends StatelessWidget {
  const PregnantQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final PregnantQuestionController controller = Get.find();
    controller.startupLogic();

    return context.secondaryGradientScaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            spacing: 24.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 36.h),
              const StepProgressBarWidget(
                  currentStepValue: 1, totalStepsValue: 5),
              Text(
                "are_you_pregnant".tr,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "pregnant_question_hint".tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      controller.setPregnant(Pregnant.Is_Pregnant);
                      controller.onConfirm();
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
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorManager.white,
                              ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      controller.setPregnant(Pregnant.Not_Pregnant);
                      controller.onNotPregnant();
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
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorManager.hotPink,
                              ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
