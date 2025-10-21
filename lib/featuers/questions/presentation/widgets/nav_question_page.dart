
import 'widgets.dart';

class NavQuestionPage extends StatefulWidget {
  const NavQuestionPage({super.key});

  @override
  State<NavQuestionPage> createState() => _NavQuestionPageState();
}

class _NavQuestionPageState extends State<NavQuestionPage> {
  int currentStep = 1;
   List<Widget> screens =[
     const DueDatePage(),
     const MenstrualPeriodPage(),
    const PregnancyInfoPage(),
    const MedicalHistoryPage(),
    const AboutYouPage(),
  ];
  int totalSteps = 5;



  @override
  Widget build(BuildContext context) {
    ///change statful screen and every setstate with controller
    final value = currentStep / totalSteps;
    return AppBackGround(
        child: Scaffold(
      appBar: AppBar(
        leading: currentStep == 1
            ? const BackButton()
            : BackButton(
                onPressed: () {
                  setState(() {
                    currentStep--;
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
                    ? "${"step".tr}  $currentStep/ $totalSteps "
                    : "${"step".tr}  $totalSteps/ $currentStep ",
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
              const HeightSpace(16),
              IndexedStack(
                index: currentStep-1 ,
                children: screens,
              ),

              AppElevatedButton(
                  onPressed: () {
                    if (currentStep <= screens.length-1 ) {
                      currentStep++;
                    } else {
                      ///navigate to home
                      return;
                    }
                    setState(() {});
                  },
                  text: "continue"),
              const HeightSpace(16),
            ],
          ),
        ),
      ),
    ));
  }
}
