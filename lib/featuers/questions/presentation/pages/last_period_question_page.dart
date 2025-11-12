import '../widgets/widgets.dart';

class LastPeriodQuestionPage extends StatelessWidget {
  const LastPeriodQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondBackGround(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only( top: 8.h,bottom: 16.h,left: 16.w,right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("last-period".tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle18displaySmall600.copyWith(fontSize:22.sp)),
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
                const HeightSpace(32),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: context.pinkSherbet.withAlpha(40),
                  ),
                  child: Text("last-period-sheet".tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.kTextStyle14MediumGrey400
                          .copyWith(color: ColorManager.primary)),
                ),
                const HeightSpace(16),
                AppElevatedButton(
                    onPressed: () {},
                    text: "continue"),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
