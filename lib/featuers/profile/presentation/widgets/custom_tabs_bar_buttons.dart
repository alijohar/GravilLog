import 'barrel.dart';

class ContainerTabsButton extends StatelessWidget {
  const ContainerTabsButton({super.key,
    required this.text, required this.onTap, required this.isSelected});

  final void Function()? onTap;
  final bool isSelected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected?
             ColorManager.containerTabColor:
            ColorManager.whiteShade,
            borderRadius: BorderRadius.all(Radius.circular(8.r))
        ),
        padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w) ,
        child: Text(
          text.tr,
          textAlign: TextAlign.center,
          style:
          isSelected?
          AppTextStyles.kTextStyle14black600.
          copyWith(color: ColorManager.white):
          AppTextStyles.kTextStyle14black600,
        ),
      ),
    );
  }
}
