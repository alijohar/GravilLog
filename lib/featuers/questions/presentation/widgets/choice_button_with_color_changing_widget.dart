import '../widgets/widgets.dart';

class ChoiceButtonWithColorChanging extends StatelessWidget {
  const ChoiceButtonWithColorChanging(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.textButton});
  final bool isSelected;
  final String textButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: onTap,
      elevation: isSelected ? 0 : 5,
      text: textButton,
      textStyle: isSelected
          ? AppTextStyles.textStyle14bodyMedium400
              .copyWith(color: ColorManager.white)
          : AppTextStyles.textStyle14bodyMedium400,
      backGroundColor: isSelected ? ColorManager.primary : ColorManager.white,
    );
  }
}
