import '../../featuers/profile/presentation/widgets/barrel.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title, this.trailingWidget,});
  final String title;
  final Widget? trailingWidget;
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale(AppConstants.englishLanguage),
      child: AppBar(
        backgroundColor: ColorManager.scaffoldSecondBackGround,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconAssets.backIcon,
            height: 30.h,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(title.tr, style: AppTextStyles.textStyle22black600),
        centerTitle: true,
        actions: [
          trailingWidget ?? const AppEmptyWidget(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}
