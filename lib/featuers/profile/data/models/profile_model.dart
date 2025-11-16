import 'package:flutter/material.dart';

enum TrailingType { arrow, textField, none }
class ProfileItemModel {
  final TrailingType trailingType;
  final String? trailingText;
  final Widget? leadingWidget;
  final String? hintText;
  final String title;
  final void Function()? onTap;
  final TextEditingController ?controller;

  const ProfileItemModel(
      {
        required this.trailingType,
        this.hintText,
        this.leadingWidget,
        this.controller,
        this.trailingText,
        required this.title,
        this.onTap,
      });
}


