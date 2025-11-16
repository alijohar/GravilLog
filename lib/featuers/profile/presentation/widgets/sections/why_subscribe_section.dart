
import '../barrel.dart';

class WhySubscribeSection extends StatelessWidget {
  const WhySubscribeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60.h
      ),
      decoration: BoxDecoration(
        color: ColorManager.darkWhiteShade,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Center(
        child: Text(
            TranslationKeys.why.tr,
          style: AppTextStyles.kTextStyle14Black800
        ),
      ),
    );
  }
}
