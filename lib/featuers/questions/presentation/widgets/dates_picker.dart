import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/questions/presentation/widgets/widgets.dart';

class DatesPicker extends StatefulWidget {
  const DatesPicker({super.key});

  @override
  State<DatesPicker> createState() => _DatesPickerState();
}

class _DatesPickerState extends State<DatesPicker> {
  var selectedDate = DateTime.now().obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: BorderRadius.circular(24.r)),
      height: 324.h,
      width: 1.sw,
      child: DatePicker(
        initialPickerType: PickerType.days,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        enabledCellsTextStyle: context.textStyles.headlineSmall
            ?.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
        currentDateDecoration: const BoxDecoration(
          color: ColorManager.peachyPink,
          shape: BoxShape.circle,
        ),
        highlightColor: context.surfaceColor,
        splashRadius: 0,
        leadingDateTextStyle: context.textStyles.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        daysOfTheWeekTextStyle: context.textStyles.headlineSmall!.copyWith(
          color: ColorManager.mediumGrey,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        slidersSize: 16.sp,
        slidersColor: context.pinkSherbet,
        selectedCellTextStyle: context.textStyles.headlineSmall
            ?.copyWith(color: context.primaryColor, fontWeight: FontWeight.w700),
        selectedCellDecoration: const BoxDecoration(
          color: ColorManager.peachyPink,
          shape: BoxShape.circle,
        ),
        currentDateTextStyle: context.textStyles.headlineSmall?.copyWith(
            color: context.primaryColor, fontWeight: FontWeight.w700),
        currentDate: selectedDate.value,
        centerLeadingDate: true,
        minDate: DateTime.now().subtract(const Duration(days: 365)),
        maxDate: DateTime.now(),
        onDateSelected: (newDate) => setState(() {
          selectedDate.value = newDate;
        }),
      ),
    );
  }
}
