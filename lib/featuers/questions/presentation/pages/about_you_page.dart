import '../widgets/widgets.dart';

class AboutYouPage extends StatelessWidget {
  const AboutYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "aboutYou".tr,
          style:
              AppTextStyles.textStyle18displaySmall600
        ),
        const HeightSpace(16),
        Text(
          "bestForYou".tr,
          style: AppTextStyles.kTextStyle16Grey400,
        ),
        const HeightSpace(32),

        ///change stateful in widget and add controller
        const DropDownBloodTypes(),

        const HeightSpace(16),

        ContainerWithShadowColor(
          child: CustomTextFormField(
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
            hintText: "height".tr,
          ),
        ),
        const HeightSpace(16),
        ContainerWithShadowColor(
          child: CustomTextFormField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
            hintText: "weight".tr,
          ),
        ),
        const HeightSpace(24),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.pinkSherbet.withAlpha(40),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IBM".tr,
                style: AppTextStyles.kTextStyleHead16Weight700
                    .copyWith(fontSize: 14.sp),
              ),
              Text.rich(TextSpan(
                  text: "in".tr,
                  style: AppTextStyles.kTextStyle16Grey400
                      .copyWith(fontSize: 14.sp, color: ColorManager.grey3),
                  children: [
                    TextSpan(
                        text: "normal".tr,
                        style: AppTextStyles.textStyle14headlineMedium500
                            .copyWith(color: ColorManager.primary)),
                    TextSpan(
                        text:"healthyWeight".tr,
                        style: AppTextStyles.kTextStyle16Grey400.copyWith(
                            fontSize: 14.sp, color: ColorManager.grey3)),
                  ])),
            ],
          ),
        ),
      ],
    );
  }
}
