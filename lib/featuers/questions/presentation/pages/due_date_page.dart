import '../widgets/widgets.dart';

class DueDatePage extends StatelessWidget {
  const DueDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "due_date_question".tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.kTextStyleHead20Weight800),
        const HeightSpace(16),
        const DatesPicker(),
        const HeightSpace(16),
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.lastPeriodQuestionRoute);
          },
          child: Text(
            "help_calculate"
                .tr,
            style:  AppTextStyles.kTextStyle14primary600

          ),
        ),
      ],
    );
  }
}
