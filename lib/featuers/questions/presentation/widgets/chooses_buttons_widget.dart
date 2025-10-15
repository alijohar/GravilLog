import '../widgets/widgets.dart';

class ChoosesButtons extends StatefulWidget {
  const ChoosesButtons({
    super.key,
    required this.textButtonOne,
    required this.textButtonTwo,
    required this.textButtonThree,
  });
  final String textButtonOne;
  final String textButtonTwo;
  final String textButtonThree;

  @override
  State<ChoosesButtons> createState() => _ChoosesButtonsState();
}

class _ChoosesButtonsState extends State<ChoosesButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 16.h,
          children: [
            Expanded(
              child: ChoiceButtonWithColorChanging(
                onTap: () => setState(() {
                  selectedIndex = 0;
                }),
                isSelected: selectedIndex == 0,
                textButton: widget.textButtonOne,
              ),
            ),
            Expanded(
              child: ChoiceButtonWithColorChanging(
                onTap: () => setState(() {
                  selectedIndex = 1;
                }),
                isSelected: selectedIndex == 1,
                textButton: widget.textButtonTwo,
              ),
            ),
          ],
        ),
        const HeightSpace(16),
        ChoiceButtonWithColorChanging(
          onTap: () => setState(() {
            selectedIndex = 2;
          }),
          isSelected: selectedIndex == 2,
          textButton: widget.textButtonThree,
        ),
      ],
    );
  }
}
