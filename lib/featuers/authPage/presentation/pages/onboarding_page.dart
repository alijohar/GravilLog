import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';

import '../../../../core/resources/color_manager.dart';

class OnboardView extends StatelessWidget {
  OnboardView({super.key});

  final OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      // arrow back button in app bar
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          icon: Icon(
            Icons.arrow_back,
            color: context.textPrimary,
            size: 24.sp,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          // get all available width
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // space between indicator and image and bottom section
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Obx(() => Container(
                  // margin to apply figma design
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                  child: SvgPicture.asset(
                    onboardingController
                        .onboardImages[onboardingController.currentIndex.value],
                    width: 1.sw,
                    // this height to show full image without overflow
                    height: 333.h,
                    clipBehavior: Clip.none,
                    fit: BoxFit.contain,
                  ),
                )),
            // build indicator
            _buildIndicator(context),
            // save space
            SizedBox(height: 14.h),
            // bottom section container and decoration
            Container(
              width: 1.sw,
              height: 202.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              // bottom section with onboarding text and continue button
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // build carousel slider for onboarding text as Expanded to take all available space
                  Expanded(
                    child: CarouselSlider.builder(
                      itemCount: onboardingController.onboardImages.length,
                      options: CarouselOptions(
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          onboardingController.currentIndex.value = index;
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        // to build onboarding text based on index and make it Slidable
                        return _buildOnboardingTextSwitching(index, context);
                      },
                    ),
                  ),
                  // save space
                  SizedBox(height: 24.h),
                  // build continue button stabled at bottom
                  ElevatedButton(
                    onPressed: () {
                      onboardingController.localDataSource
                          .setOnBoardingScreenViewed();
                      onboardingController.navigateToLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.pinkSherbet,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(1.sw, 48.h),
                    ),
                    child: Text(
                      "continue".tr,
                      style: context.textStyles.bodyMedium
                          ?.copyWith(color: context.onPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// build onboarding text based on index
  Widget _buildOnboardingTextSwitching(int index, BuildContext context) {
    //final model = onboardingController; // controller replaces ViewModel
    switch (index) {
      case 0:
        return _buildOnboardingText(
          context: context,
          image: onboardingController.onboardImages[0],
          title: "onboard1_title".tr,
          description: _richTextBulider(context, "onboard1_description"),
        );
      case 1:
        return _buildOnboardingText(
          context: context,
          image: onboardingController.onboardImages[1],
          title: "onboard2_title".tr,
          description: _richTextBulider(context, "onboard2_description"),
        );
      case 2:
        return _buildOnboardingText(
          context: context,
          image: onboardingController.onboardImages[2],
          title: "onboard3_title".tr,
          description: _richTextBulider(context, "onboard3_description"),
        );
      default:
        return Container();
    }
  }

// build rich text for description
  RichText _richTextBulider(BuildContext context, String descriptionKey) {
    return RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      text: TextSpan(
        style: context.textStyles.bodyMedium,
        children: [
          TextSpan(text: descriptionKey.tr),
        ],
      ),
    );
  }

// Build onboarding text widget
  Widget _buildOnboardingText({
    required BuildContext context,
    required String image,
    required String title,
    required RichText description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.textStyles.headlineLarge
              ?.copyWith(color: context.hotPink),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        description,
      ],
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              onboardingController.onboardImages.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Container(
                // change width and shape based on current index
                width: onboardingController.currentIndex.value == entry.key
                    ? 32.0
                    : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  // change shape based on current index
                  shape: onboardingController.currentIndex.value == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  // change border radius based on current index
                  borderRadius:
                      onboardingController.currentIndex.value == entry.key
                          ? BorderRadius.circular(8.r)
                          : null,
                  // change color based on current index
                  color: onboardingController.currentIndex.value == entry.key
                      ? ColorManager.pinkSherbet
                      : ColorManager.white,
                ),
              ),
            );
          }).toList(),
        ));
  }
}
