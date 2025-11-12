
import '../widgets/widgets.dart';

class PregnancyInfoPage extends StatelessWidget {
  const PregnancyInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("moreAboutYou".tr,
          style: AppTextStyles.textStyle18displaySmall600
             ),
      const HeightSpace(16),
      Text(
        "support".tr,
        style: AppTextStyles.kTextStyle16Grey400,
      ),
      const HeightSpace(32),
      Text("gender".tr,
          style: AppTextStyles.kTextStyle20Pink700
              .copyWith(color: ColorManager.textPrimary)),
      const HeightSpace(16),
      const ChoosesButtons(
        textButtonOne: "boy",
        textButtonTwo: "girl",
        textButtonThree: "don’t_know",
      ),
      const HeightSpace(32),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("relation".tr,
              style: AppTextStyles.kTextStyle20Pink700
                  .copyWith(color:ColorManager.textPrimary)),
          GestureDetector(
              onTap: () {
                return Deviceutils.showCustomDialog(
                    title: "askTo".tr,
                    textAlign: TextAlign.start,
                    textStyle: AppTextStyles.textStyle14bodyMedium400,
                    backgroundColor: ColorManager.white,
                    content: Text.rich(
                      TextSpan(
                        text: "firstAccor".tr,
                        style: AppTextStyles.kTextStyleHead16Weight700,
                        children: [
                          TextSpan(
                            text: "cousin".tr,
                            style: AppTextStyles.textStyle14bodyMedium400,
                          ),
                          TextSpan(
                            text: "secondAccor".tr,
                            style: AppTextStyles.kTextStyleHead16Weight700,
                          ),
                          TextSpan(
                            text: "not_cousin".tr,
                            style: AppTextStyles.textStyle14bodyMedium400,
                          ),
                          TextSpan(
                            text: "noneAccor".tr,
                            style: AppTextStyles.kTextStyleHead16Weight700,
                          ),
                          TextSpan(
                            text: "related".tr,
                            style: AppTextStyles.textStyle14bodyMedium400,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    context);
              },
              child: const Icon(Icons.info_outline)),
        ],
      ),
      const HeightSpace(16),
      const ChoosesButtons(
        textButtonOne: "first",
        textButtonTwo: "second",
        textButtonThree: "none",
      ),
    ]);
  }
}
