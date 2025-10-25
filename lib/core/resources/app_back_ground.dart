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

class AppBackGroundSkyPinkLight extends StatelessWidget {
  const AppBackGroundSkyPinkLight({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.skyPinkLight
          
        ),
        child: child);
  }
}

class AppBackGround2 extends StatelessWidget {
  const AppBackGround2({super.key, required this.child});
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
            colors: [ColorManager.skyPinkLight, ColorManager.skyBlueLight],
          ),
        ),
        child: child);
  }
}
