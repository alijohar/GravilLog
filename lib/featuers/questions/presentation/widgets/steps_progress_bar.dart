import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';

class StepProgressBarWidget extends StatelessWidget {
  final int currentStepValue;
  final int totalStepsValue;

  final Color progressBarColor;
  final Color backgroundProgressBarColor;

  const StepProgressBarWidget({
    super.key,
    required this.currentStepValue,
    required this.totalStepsValue,
    this.progressBarColor = ColorManager.hotPink,
    this.backgroundProgressBarColor = ColorManager.peachyPink, // Light pink
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the progress ratio (e.g. 1/5 = 0.2)
    final double progressRatio = currentStepValue / totalStepsValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The top text "Step 1/5"
        Text('Step $currentStepValue/$totalStepsValue',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.hotPink,
                )),

        SizedBox(height: 12.h),

        // Here, we build the progress bar itself
        LayoutBuilder(
          builder: (context, constraints) {
            // LayoutBuilder gives us the maximum width of the parent widget
            final double maxWidth = 1.sw;
            final double progressWidth = maxWidth * progressRatio;

            return Stack(
              children: [
                // The background progress bar (the light pink one)
                Container(
                  width: maxWidth,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: backgroundProgressBarColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                // The foreground progress bar (the hot pink one)
                // We use AnimatedContainer to animate the width of the bar when the progress changes
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: progressWidth,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: progressBarColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
