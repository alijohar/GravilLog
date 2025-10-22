import '../widgets/widgets.dart';

class PregnantQuestionPage extends StatelessWidget {
  const PregnantQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PregnantQuestionController controller = Get.find();
    controller.startupLogic();
    return context.secondaryGradientScaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            const HeightSpace(100),
            Text(
              "are_you_pregnant".tr,
              style: AppTextStyles.kTextStyleHead16Weight700
                  .copyWith(fontSize: 20.sp),
            ),
            const HeightSpace(24),
            Text("pregnant_question_hint".tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.kTextStyle16Grey400),
            const HeightSpace(24),
            AppElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.questionScreenRoute);
                },
                text: "yes"),
            const HeightSpace(16),
            AppElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.lastPeriodQuestionRoute);
              },
              text: "no",
              borderColor: ColorManager.primary,
              textStyle: AppTextStyles.kTextStyle16ButtonText800
                  .copyWith(color: ColorManager.primary),
              backGroundColor: ColorManager.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
