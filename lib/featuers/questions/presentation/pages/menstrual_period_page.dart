import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';

import '../../data/models/pregnant_info_model.dart';
import '../controllers/menstrual_period_controller.dart';

class MenstrualPeriodView extends StatelessWidget {
  MenstrualPeriodView({super.key});

  final MenstrualPeriodController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "please_select_menstrual_period".tr,
                    style: TextStyle(
                      color: context.pinkSherbet,
                    ),
                  ),
                ),

                Obx(() =>Container(
                  color: ColorManager.pinkSherbet.withOpacity(0.2),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 370,
                  width: double.infinity,
                  child: DatePicker(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      enabledCellsTextStyle: context.textStyles.headlineLarge,
                      currentDateDecoration: BoxDecoration(
                        color: context.pinkSherbet,
                        shape: BoxShape.circle,
                      ),
                      highlightColor: context.surfaceColor,
                      splashRadius: 0,
                      leadingDateTextStyle: context.textStyles.displayLarge,
                      daysOfTheWeekTextStyle: context.textStyles.bodyLarge?.copyWith(color: context.grey),
                      slidersSize: 15,
                      slidersColor: context.onSurfaceColor,
                      selectedCellTextStyle: context.textStyles.bodyMedium?.copyWith(color: context.onPrimaryColor),
                      selectedCellDecoration: BoxDecoration(
                        color: context.pinkSherbet,
                        shape: BoxShape.circle,
                      ),
                      currentDateTextStyle: context.textStyles.bodyMedium?.copyWith(color: context.onPrimaryColor),
                      currentDate: controller.selectedDate.value,
                      centerLeadingDate: false,
                      minDate: DateTime.now().subtract(const Duration(days: 365)),
                      maxDate: DateTime.now(),
                    onDateSelected: (newDate) => controller.selectedDate.value = newDate,

                  ),
                )),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: context.outlineColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Dropdown
                // Obx(() => DropdownButton<String>(
                //   value: controller.selectedValue.value,
                //   hint: Text('${controller.selectedMenstrualCycle.value} Tage'),
                //   items: controller.menstrualLength.map((int value) {
                //     return DropdownMenuItem<String>(
                //       value: value.toString(),
                //       child: Text('$value ${"ta".tr}'),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     controller.selectedValue.value = value;
                //     controller.selectedMenstrualCycle.value = int.parse(value!);
                //   },
                // )),


                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                  "cycle_length".tr,
                    style: TextStyle(
                      color: context.pinkSherbet,
                    ),
                  ),
                ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DropdownButtonHideUnderline(
          child: Obx(() => DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    Deviceutils.replacePlaceholder(
                        "days".tr, {'s': '${controller.menstrualLength[7]}'}),
                    style: context.textStyles.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: controller.menstrualLength
                .map((int item) => DropdownMenuItem<String>(
              value: item.toString(),
              child: Text(
                Deviceutils.replacePlaceholder(
                    "days".tr, {'s': '$item'}),
                style: context.textStyles.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: controller.selectedValue.value,
            onChanged: (String? value) {
              if (value != null) {
                controller.selectedValue.value = value;
                controller.selectedMenstrualCycle.value = int.parse(value.split(' ')[0]);
              }
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                color: ColorManager.pinkSherbet.withOpacity(0.3),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 20,
              ),
              iconSize: 14,
              iconEnabledColor: context.onSurfaceColor,
              iconDisabledColor: context.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                color: context.pinkSherbet.withOpacity(0.3),
              ),
              offset: const Offset(0, 250),
              elevation: 0,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          )),
        ),
      )

              ],
            ),

        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              controller.onCalculate(
                pregnant: controller.pregnantData.value,
                menstrualFirstDay: controller.selectedDate.value,
                menstrualCycleLength: controller.selectedMenstrualCycle.value,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.pinkSherbet,
              shape: const BeveledRectangleBorder(),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "calculate".tr,
                  style: context.textStyles.bodyMedium?.copyWith(color: context.onPrimaryColor),
                ),
              ],
            ),
          ),
        )

          ],
        ),
      ),
    );
  }
}
