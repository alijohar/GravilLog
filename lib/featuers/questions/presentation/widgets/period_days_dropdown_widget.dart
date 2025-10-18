import '../widgets/widgets.dart';

class PeriodDaysDropdownWidget extends StatelessWidget {
  PeriodDaysDropdownWidget({super.key});
  final List<int> menstrualLength = List.generate(15, (index) => 21 + index);
  var selectedDate = DateTime.now().obs;
  var selectedMenstrualCycle = 28.obs;
  var selectedValue = RxnString();

  @override
  Widget build(BuildContext context) {
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
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset(
            IconAssets.dropDownIcon,
            colorFilter:
                const ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
        ),
      )),
    );
  }
}
