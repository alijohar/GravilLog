
import '../widgets/widgets.dart';


class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "medicalHistory".tr,
        style:
            AppTextStyles.textStyle18displaySmall600,
      ),
      const HeightSpace(16),
      Text(
        "conditions".tr,
        style: AppTextStyles.kTextStyleHead16Weight700,
      ),
      const HeightSpace(16),
      const ExistingConditions(),
      const HeightSpace(32),
      Text(
        "previous".tr,
        style: AppTextStyles.kTextStyleHead16Weight700,
      ),
      const HeightSpace(16),
      ContainerWithShadowColor(
        child: CustomTextFormField(
          keyboardType: TextInputType.number,
          controller: TextEditingController(),
          hintText: "0",
        ),
      ),
      const HeightSpace(32),
    ]);
  }
}
