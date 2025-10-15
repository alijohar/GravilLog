import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';

class MenstrualPeriodView extends StatefulWidget {
  const MenstrualPeriodView({super.key});

  @override
  State<MenstrualPeriodView> createState() => _MenstrualPeriodViewState();
}

class _MenstrualPeriodViewState extends State<MenstrualPeriodView> {
  final List<int> menstrualLength = List.generate(15, (index) => 21 + index);
  var selectedDate = DateTime.now().obs;
  var selectedMenstrualCycle = 28.obs; // Defaultwert
  var selectedValue = RxnString();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24.h,
      children: [
        Text("please_select_menstrual_period".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith()),

        datePicker(context),

        // Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "cycle_length".tr,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
          ),
        ),
        periodDaysDropdown(context),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.pinkSherbet.withAlpha(40),
          ),
          child: Text(
            "menstrual_period_hint".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: context.pinkSherbet,
                ),
          ),
        ),
        SizedBox(
          height: 1.h,
        )
      ],
    );
  }

  periodDaysDropdown(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                Deviceutils.replacePlaceholder(
                    "days".tr, {'s': '${menstrualLength[7]}'}),
                style: context.textStyles.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: menstrualLength
            .map((int item) => DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(
                    Deviceutils.replacePlaceholder("days".tr, {'s': '$item'}),
                    style: context.textStyles.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue.value,
        onChanged: (String? value) {
          if (value != null) {
            selectedValue.value = value;
            selectedMenstrualCycle.value = int.parse(value.split(' ')[0]);
          }
        },
        buttonStyleData: ButtonStyleData(
            height: 48.h,
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: ColorManager.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            )),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200.h,
          decoration: const BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          offset: const Offset(0, 250),
          elevation: 0,
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(8.r),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
        ),
      )),
    );
  }

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
