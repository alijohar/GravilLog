import '../widgets/widgets.dart';

class DueDatePage extends StatelessWidget {
  const DueDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("due_date_question".tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle22headlineMedium600),
        const HeightSpace(16),
        const DatesPicker(),
        const HeightSpace(16),
        TextButton(
          onPressed: () {
            Get.offNamed(Routes.lastPeriodQuestionRoute);
          },
          child: Text(
              "help_calculate"
                  .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
              style: AppTextStyles.textStyle14labelMedium600Pink),
        ),
      ],
    );
  }
}
