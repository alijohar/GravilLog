
import 'package:get/get.dart';

import 'widgets.dart';

class NavQuestionPage extends StatefulWidget {
  const NavQuestionPage({super.key});

  @override
  State<NavQuestionPage> createState() => _NavQuestionPageState();
}

class _NavQuestionPageState extends State<NavQuestionPage> {
  int currentStep = 1;
  final List<Widget> screens = [
    ///first three screens
    const Center(child: Text("SCREEN   1"),),
    const Center(child: Text("SCREEN   2"),),
    const PregnancyInfoPage(),
    const MedicalHistoryView(),
    const AboutYouView(),
  ];
  int titles = 5;

  @override
  Widget build(BuildContext context) {
    ///change statful screen and every setstate with controller
    final value = currentStep / titles;
    return AppBackGround(
        child: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            setState(() {
              if (currentStep == 0) {
                return;
              }
              currentStep--;
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "step $currentStep/ $titles ".tr,
              style: AppTextStyles.textStyle14bodyMedium400
                  .copyWith(color: ColorManager.primary),
            ),
            const HeightSpace(12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                minHeight: 8.h,
                value: value,
                backgroundColor: ColorManager.white,
                color: ColorManager.primary,
              ),
            ),
            const HeightSpace(24),
            Expanded(
                child: IndexedStack(
              index: currentStep-1,
              children: screens,
            )),
            AppElevatedButton(
                onPressed: () {
                  if (currentStep <= screens.length -1 ) {
                    currentStep++;
                    print(currentStep);


                  } else  {
                    print(currentStep);
                    ///navigate to home
                    return;
                  }
                  setState(() {});
                },
                text: "continue")
          ],
        ),
      ),
    ));
  }
}
