import 'package:flutter/material.dart';
import '/core/resources/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
        body: const Center(
      child: Text('home screen'),
    ));
  }
}
