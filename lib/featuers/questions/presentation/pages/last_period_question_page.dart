import 'dart:developer';

import '../widgets/widgets.dart';

class LastPeriodQuestionPage extends StatelessWidget {
  const LastPeriodQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackGroundSkyPinkLight(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeightSpace(16),
              Text("last-period".tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle22headlineMedium600),
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
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: AppElevatedButton(
              onPressed: () {
                log("${Get.previousRoute}bbb");
                if (Get.previousRoute ==
                    "${Routes.questionScreenRoute}?currentStep=1") {
                  Get.offNamed(Routes.questionScreenRoute,
                      parameters: {"currentStep": "2"});
                  //Get.back();
                } else {}
              },
              text: "continue"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
