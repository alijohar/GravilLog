import '../barrel.dart';

class GoalsSection extends StatelessWidget {
  const GoalsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            TranslationKeys.myGoal.tr,
            style: AppTextStyles.textStyle18displaySmall600),


        const CustomTabsBar()
      ],
    );
  }
}
