import 'package:flutter/material.dart';

class ContainerWithShadowColor extends StatelessWidget {
  const ContainerWithShadowColor({super.key,this.margin,required this.child});
final Widget child;
final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                color: Colors.grey.shade400),
          ]),
      child: child,
    );
  }
}
