import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';

class CustomCountryCodePicker extends StatelessWidget {
  CustomCountryCodePicker({super.key, required this.onChanged});

  final void Function(CountryCode countryCode)? onChanged;

  final _controller = CountryPickerController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.dialogShown) {}
      return Container(
        width: 50,
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: CountryCodePicker(
          onChanged: onChanged,
          initialSelection: 'SA',
          favorite: const ['+966', 'SA'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          showFlag: true,
          showFlagMain: true,
          textStyle: const TextStyle(color: Colors.black, fontSize: 10),
          alignLeft: true,
          padding: EdgeInsets.zero,
        ),
      );
    });
  }
}

final class CountryPickerController extends GetxController {
  final countryCode = CountryCode().obs;
  final _showDialog = false.obs;
  void showDialog() => _showDialog.value = true;

  void hideDialog() => _showDialog.value = false;

  bool get dialogShown => _showDialog.value;
}
