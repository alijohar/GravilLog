

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AppElevatedButton extends StatelessWidget {
 const AppElevatedButton({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text.tr,
        ),
    );
  }
}
