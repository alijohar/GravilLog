import '../widgets/barrel.dart';

class ChangeModeButtons extends StatelessWidget {
  const ChangeModeButtons({
    super.key,
    required this.controller,
    required this.newModeIndex,
  });

  final ProfileController controller;
  final int newModeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            onPressed: () => Get.back(),
            text:TranslationKeys.notNow,
            backGroundColor: ColorManager.scaffoldSecondBackGround,
            textStyle: AppTextStyles.kTextStyle14black600,

          ),
        ),
        Expanded(
          child: AppElevatedButton(
            onPressed: () {
              controller.reOrderTabsInSwitchMode(newModeIndex);
              Get.back();
            },
            text:TranslationKeys.switching,
            backGroundColor: ColorManager.containerTabColor,
            textStyle: AppTextStyles.kTextStyle14black600.copyWith(
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}