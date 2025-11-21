import '../widgets/barrel.dart';

class BabyGenderPage extends StatelessWidget {
  const BabyGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.scaffoldSecondBackGround,
      appBar: CustomAppBar(title: "Baby’s gender"),
    );
  }
}
