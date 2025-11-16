import 'barrel.dart';

class PregnancySection extends StatelessWidget {
  const PregnancySection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title.tr, style: AppTextStyles.textStyle18displaySmall600),
        const HeightSpace(16),
        ProfileTileItems(
          items: [
            ProfileItemModel(
              trailingType: TrailingType.arrow,
              onTap: ()=>Get.toNamed(Routes.babyGenderPageRoute),
              title: TranslationKeys.babyGender.tr,
            ),
            ProfileItemModel(
                title: TranslationKeys.relationToHusband.tr,
                trailingType: TrailingType.arrow,
                onTap: ()=>Get.toNamed(Routes.relationToHusbandRoute),
            ),
          ],
        ),
      ],
    );
  }
}
