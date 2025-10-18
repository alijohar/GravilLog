import '../widgets/widgets.dart';

class MenstrualPeriodPage extends StatelessWidget {
 const  MenstrualPeriodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("please_select_menstrual_period".tr,
            textAlign: TextAlign.center,
            style:AppTextStyles.kTextStyleHead20Weight800
        ),
        const HeightSpace(16),
        const DatesPicker(),
        const HeightSpace(24),
        // Button
        Text(
          "cycle_length".tr,
          style: AppTextStyles.kTextStyleHead16Weight700,
        ),
        const HeightSpace(8),
        PeriodDaysDropdownWidget(),
        const HeightSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.pinkSherbet.withAlpha(40),
          ),
          child: Text(
            "menstrual_period_hint".tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.kTextStyle14MediumGrey400.copyWith(color:ColorManager.primary)
          ),
        ),
        const HeightSpace(16),

      ],
    );
  }

}
