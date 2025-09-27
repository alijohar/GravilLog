import 'package:flutter/material.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      body: Center(
        child: Text('Template'),
      ),
    );
  }
}
