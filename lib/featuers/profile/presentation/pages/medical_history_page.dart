import '../widgets/barrel.dart';

class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.scaffoldSecondBackGround,
      appBar: CustomAppBar(title: "Medical history"),
    );
  }
}
