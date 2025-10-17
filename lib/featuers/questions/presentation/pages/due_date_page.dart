import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/questions/presentation/widgets/dates_picker.dart';

class DueDateView extends StatefulWidget {
  const DueDateView({super.key});

  @override
  State<DueDateView> createState() => _DueDateViewState();
}

class _DueDateViewState extends State<DueDateView> {
  var selectedDate = DateTime.now().obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24.h,
      children: [
        const SizedBox(
          height: 1,
        ),
        Text(
          "due_date_question"
              .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
        ),
        const DatesPicker(),
        TextButton(
          onPressed: () {},
          child: Text(
            "help_calculate"
                .tr, // NOTE: Add this key to your translation file", // NOTE: Add this key to your translation file
            style: context.textStyles.headlineMedium?.copyWith(
              color: context.pinkSherbet,
              fontWeight: FontWeight.w800,
              fontSize: 14.sp,
              decorationColor: context.pinkSherbet,
            ),
          ),
        ),
      ],
    );
  }
}
