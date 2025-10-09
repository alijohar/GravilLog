import 'package:flutter/material.dart';
import 'color_manager.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorManager.peachyPink, ColorManager.skyBlue],
          ),
        ),
        child: child);
  }
}
