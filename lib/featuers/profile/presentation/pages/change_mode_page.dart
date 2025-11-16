
import '../widgets/barrel.dart';

class ChangeModeConfirmationScreen extends StatelessWidget {
  final int newModeIndex;
  final String modeName;

  const ChangeModeConfirmationScreen({
    super.key,
    required this.newModeIndex,
    required this.modeName,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final isEn=Get.locale?.languageCode==AppConstants.englishLanguage;
    return
      Scaffold(
        backgroundColor: ColorManager.scaffoldSecondBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isEn?
                  "${TranslationKeys.youSwitching.tr}\n$modeName mode":
                  "${TranslationKeys.youSwitching.tr}$modeName ",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textStyle18displaySmall600,
                ),

                SizedBox(height: 16.h),

                Flexible(
                  child: Text(
                    TranslationKeys.helpYou.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle14bodyMedium400,
                  ),
                ),

                SizedBox(height: 48.h),

                ChangeModeButtons(controller: controller, newModeIndex: newModeIndex),
              ],
            ),
          ),
      ),
    );
  }
}

