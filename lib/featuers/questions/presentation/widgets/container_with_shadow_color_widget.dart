import 'package:gravilog_2025/featuers/questions/presentation/widgets/widgets.dart';

class ContainerWithShadowColor extends StatelessWidget {
  const ContainerWithShadowColor({super.key, this.margin, required this.child});
  final Widget child;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 45.h,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 3, spreadRadius: 1, color: Colors.grey.shade400),
          ]),
      child: child,
    );
  }
}
