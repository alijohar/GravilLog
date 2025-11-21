import 'barrel.dart';

class ConditionalSection extends StatelessWidget {
  const ConditionalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return  Obx(
          () {
        //when add subscribe user
        // if (controller.currentTabsIndex.value != 1 &&CacheUser ==subscribe) {
        if (controller.currentTab != 1) {
          return PregnancySection(
            title: controller.currentTab == 0
                ? TranslationKeys.myPregnancy.tr
                : TranslationKeys.myFamily.tr,
          );
        }
        return const AppEmptyWidget();
      },
    );
  }
}
