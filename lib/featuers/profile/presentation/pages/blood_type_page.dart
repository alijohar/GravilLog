import '../widgets/barrel.dart';

class BloodTypePage extends StatelessWidget {
  const BloodTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.scaffoldSecondBackGround,
      appBar: CustomAppBar(title: "Blood type"),

    );
  }
}
