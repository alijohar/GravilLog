import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';

class DueDateView extends StatefulWidget {
  const DueDateView({super.key});

  @override
  State<DueDateView> createState() => _DueDateViewState();
}

class _DueDateViewState extends State<DueDateView> {
  var selectedDate = DateTime.now().obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24.h,
      children: [
        Text(
          "due_date_question"
              .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        datePicker(context),
        TextButton(
          onPressed: () {},
          child: Text(
            "help_calculate"
                .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
            style: context.textStyles.headlineMedium?.copyWith(
              color: context.pinkSherbet,
              decorationColor: context.pinkSherbet,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the styled calendar widget.
  datePicker(BuildContext context) {
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
          currentDate: selectedDate.value,
          centerLeadingDate: true,
          minDate: DateTime.now().subtract(const Duration(days: 365)),
          maxDate: DateTime.now(),
          onDateSelected: (newDate) => setState(() {
            selectedDate.value = newDate;
          }),
        ),
      ),
    );
  }
}
