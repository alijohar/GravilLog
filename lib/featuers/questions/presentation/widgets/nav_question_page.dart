import 'widgets.dart';

class NavQuestionPage extends StatefulWidget {
  int currentStep = 1;
  NavQuestionPage({super.key, required this.currentStep});

  @override
  State<NavQuestionPage> createState() => _NavQuestionPageState();
}

class _NavQuestionPageState extends State<NavQuestionPage> {
  List<Widget> screens = [
    const DueDatePage(),
    // const MenstrualPeriodPage(),
    const PregnancyInfoPage(),
    const MedicalHistoryPage(),
    const AboutYouPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    int totalSteps = screens.length;

    ///change statful screen and every setstate with controller
    final value = widget.currentStep / totalSteps;
    return AppBackGround2(
        child: Scaffold(
      appBar: AppBar(
        leading: widget.currentStep == 1
            ? const BackButton()
            : BackButton(
                onPressed: () {
                  setState(() {
                    widget.currentStep--;
                  });
                },
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Get.locale!.languageCode == AppConstants.englishLanguage
                    ? "${"step".tr}  ${widget.currentStep}/ $totalSteps "
                    : "${"step".tr}  $totalSteps/ {$widget.currentStep} ",
                style: AppTextStyles.textStyle14bodyMedium400
                    .copyWith(color: ColorManager.primary),
              ),
              const HeightSpace(12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  minHeight: 8.h,
                  value: value,
                  backgroundColor: ColorManager.skyPink,
                  color: ColorManager.primary,
                ),
              ),
              const HeightSpace(24),
              IndexedStack(
                index: widget.currentStep - 1,
                children: screens,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedScale(
        scale: isKeyboardVisible ? 0 : 1,
        duration: const Duration(microseconds: 0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: AppElevatedButton(
              onPressed: () {
                if (widget.currentStep <= screens.length - 1) {
                  widget.currentStep++;
                } else {
                  ///navigate to home
                  return;
                }
                setState(() {});
              },
              text: "continue"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
