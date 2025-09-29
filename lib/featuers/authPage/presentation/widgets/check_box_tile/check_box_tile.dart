import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/check_box_tile/check_box_tile_controller.dart';

class CircularCheckboxTile extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final String label;
  final _checkBoxTileController = Get.put(CheckBoxTileController());
  CircularCheckboxTile({
    super.key,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            log('checked value is: ${_checkBoxTileController.checked.value}');
            _checkBoxTileController.changeValue();
            onChanged(_checkBoxTileController.checked.value);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: _checkBoxTileController.checked.value
                      ? null
                      : BoxBorder.all(),
                  color: _checkBoxTileController.checked.value
                      ? context.pinkSherbet
                      : Colors.grey.shade300,
                ),
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: _checkBoxTileController.checked.value
                      ? Colors.white
                      : Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              Text(label,
                  style: context.textStyles.bodyMedium!
                      .copyWith(color: context.textTertiary)),
            ],
          ),
        ));
  }
}
