import '../widgets/barrel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.scaffoldSecondBackGround,
      appBar: CustomAppBar(
        title: TranslationKeys.profile,
        trailingWidget: IconButton(
          icon: SvgPicture.asset(IconAssets.settingsIcon),
          onPressed: () => Get.toNamed(Routes.settingsScreenRoute),
        ),
      ),
      body: GestureDetector(
        onTap: () => Deviceutils.closeKeyboard(context),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(16.r),
          child: const Column(
            children: <Widget>[
              ProfileHeaderSection(),
              HeightSpace(24),
              WhySubscribeSection(),
              HeightSpace(40),
              RemainingSections(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
