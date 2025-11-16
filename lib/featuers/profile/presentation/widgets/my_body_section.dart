import 'barrel.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(TranslationKeys.myBody.tr,
            style: AppTextStyles.textStyle18displaySmall600),
        ProfileTileItems(
          items: [
            ProfileItemModel(
                title: TranslationKeys.height.tr,
                hintText: TranslationKeys.cmData.tr,
                trailingType: TrailingType.textField,
                controller: controller.heightController),
            ProfileItemModel(
                title: TranslationKeys.weight.tr,
                hintText: TranslationKeys.kgData.tr,
                trailingType: TrailingType.textField,
                controller: controller.weightController),
            ProfileItemModel(
                title: TranslationKeys.previousCSections.tr,
                trailingType: TrailingType.textField,
                hintText: TranslationKeys.data.tr,
                controller: controller.previousCSectionController),
          ],
        ),
        ProfileTileItems(
          items: [
            ProfileItemModel(
              title: TranslationKeys.bloodType.tr,
              trailingType: TrailingType.arrow,
              onTap: () => Get.toNamed(Routes.bloodTypePageRoute),
            ),
            ProfileItemModel(
              title: TranslationKeys.medicalHistory.tr,
              trailingType: TrailingType.arrow,
              hintText: TranslationKeys.data.tr,
              onTap: () => Get.toNamed(Routes.medicalHistoryPageRoute),
            ),
          ],
        ),
      ],
    );
  }
}
