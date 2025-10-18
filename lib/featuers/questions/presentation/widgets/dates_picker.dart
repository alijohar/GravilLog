import 'widgets.dart';

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
      height: 350.h,
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: BorderRadius.circular(24.r)),
      child: Localizations.override(
        context: context,
        locale: const Locale(AppConstants.englishLanguage),
        child: DatePicker(
          disabledCellsTextStyle: AppTextStyles.textStyle16bodyLarge400,
          initialPickerType: PickerType.days,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          enabledCellsTextStyle: AppTextStyles.textStyle16bodyLarge400,
          currentDateDecoration: const BoxDecoration(
            color: ColorManager.peachyPink,
            shape: BoxShape.circle,
          ),
          leadingDateTextStyle: AppTextStyles.kTextStyleHead16Weight700,
          daysOfTheWeekTextStyle: AppTextStyles.kTextStyle14MediumGrey400,
          slidersSize: 16.sp,
          slidersColor: ColorManager.pinkSherbet,
          selectedCellTextStyle: AppTextStyles.kTextStyleHead16Weight700,
          selectedCellDecoration: const BoxDecoration(
            color: ColorManager.peachyPink,
            shape: BoxShape.circle,
          ),
          currentDateTextStyle: AppTextStyles.kTextStyle20Pink700,
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
