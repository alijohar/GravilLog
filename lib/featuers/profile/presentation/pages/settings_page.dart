import '../widgets/barrel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.scaffoldSecondBackGround,
      appBar: CustomAppBar(title: "Settings"),
    );
  }
}
