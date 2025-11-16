import 'package:gravilog_2025/featuers/profile/presentation/pages/change_mode_page.dart';

import 'barrel.dart';

class CustomTabsBar extends StatelessWidget {
  const CustomTabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 12.w,
          children:controller.tabsOrder.map((tabIndex){
            late String text;
            switch(tabIndex){
              case 0: text = TranslationKeys.trackPregnancy.tr; break;
              case 1: text = TranslationKeys.getPregnant.tr; break;
              case 2: text = TranslationKeys.postPartum.tr; break;
            }
            return   ContainerTabsButton(
              text: text,
              isSelected: controller.currentTabsIndex.value == controller.tabsOrder.indexOf(tabIndex),
              onTap: () {
                Deviceutils.closeKeyboard(context);
                Get.to(ChangeModeConfirmationScreen(
                    newModeIndex: tabIndex,
                    modeName:text));
                controller.currentTabsIndex.value = controller.tabsOrder.indexOf(tabIndex);
              },
            );

          }).toList()
        ),
      ),
    );
  }

}
