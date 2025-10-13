import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/featuers/questions/presentation/controllers/due_date_controller.dart';
import 'package:gravilog_2025/featuers/questions/presentation/widgets/steps_progress_bar.dart';

class DueDateView extends StatelessWidget {
  DueDateView({super.key});

  final DueDateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return context.secondaryGradientScaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.secondaryGradientStart,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: Icon(
            Icons.arrow_back,
            color: context.textPrimary,
            size: 24,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              const StepProgressBarWidget(
                currentStepValue: 2,
                totalStepsValue: 5,
              ),
              SizedBox(height: 24.h),
              Text(
                "due_date_question"
                    .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 24.h),
              _datePicker(context),
              SizedBox(height: 24.h),
              TextButton(
                onPressed: () => controller.onHelpCalculate(),
                child: Text(
                  "help_calculate"
                      .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
                  style: context.textStyles.headlineMedium?.copyWith(
                    color: context.pinkSherbet,
                    decorationColor: context.pinkSherbet,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("continue".tr),
        ),
      ),
    );
  }

  /// Builds the styled calendar widget.
  _datePicker(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(24.r)),
        height: 324.h,
        width: 1.sw,
        child: DatePicker(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          enabledCellsTextStyle: context.textStyles.headlineLarge,
          currentDateDecoration: BoxDecoration(
            color: context.pinkSherbet,
            shape: BoxShape.circle,
          ),
          highlightColor: context.surfaceColor,
          splashRadius: 0,
          leadingDateTextStyle: context.textStyles.displayLarge,
          daysOfTheWeekTextStyle: context.textStyles.headlineSmall!.copyWith(
            color: context.darkGrey,
          ),
          slidersSize: 15,
          slidersColor: context.pinkSherbet,
          selectedCellTextStyle: context.textStyles.bodyMedium
              ?.copyWith(color: context.onPrimaryColor),
          selectedCellDecoration: BoxDecoration(
            color: context.pinkSherbet,
            shape: BoxShape.circle,
          ),
          currentDateTextStyle: context.textStyles.bodyMedium
              ?.copyWith(color: context.onPrimaryColor),
          currentDate: controller.selectedDate.value,
          centerLeadingDate: true,
          minDate: DateTime.now().subtract(const Duration(days: 365)),
          maxDate: DateTime.now(),
          onDateSelected: (newDate) => controller.selectedDate.value = newDate,
        ),
      ),
    );
  }
}
