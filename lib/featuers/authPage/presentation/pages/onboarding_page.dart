import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        leading: _backButtonWithArrow(context),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            // stable bottom section with indicator .
            Positioned.fill(
              child: _stableContant(context),
            ),
            // Carousel slider for SlidableContent and support fill Screen.
            // to build onboarding text based on index and make it Slidable
            _sliderBuilder(
                (index) => Positioned.fill(
                        child: _slidableContant(
                      context,
                      index,
                    )),
                context),
          ],
        ),
      ),
      // floating action button location to center docked
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Continue button at the bottom center and Stable .
      floatingActionButton: Container(
        // margin to apply figma design
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: _continueButton(context),
      ),
    );
  }

  // back button with arrow style and action
  IconButton _backButtonWithArrow(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      icon: Icon(
        Icons.arrow_back,
        color: context.textPrimary,
        size: 24,
      ),
      onPressed: () => Get.back(),
    );
  }

  // stable content builder
  Column _stableContant(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const SizedBox(height: 32),
        _buildIndicator(context),
        const SizedBox(height: 14),
        Container(
          width: context.width,
          height: 202,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          // margin to apply figma design
          decoration: const BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Obx(() => _buildOnboardingTextSwitching(
              onboardingController.currentIndex.value, context)),
        ),
      ],
    );
  }

  CarouselSlider _sliderBuilder(
      Widget Function(int index) contant, BuildContext context) {
    return CarouselSlider.builder(
      itemCount: onboardingController.onboardImages.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        height: context.height,
        autoPlayCurve: Curves.elasticInOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          onboardingController.currentIndex.value = index;
        },
      ),
      itemBuilder: (context, index, realIndex) {
        // return contant based on index
        return contant(index);
      },
    );
  }

  // Continue button Builder with style and action.
  ElevatedButton _continueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onboardingController.localDataSource.setOnBoardingScreenViewed();
        onboardingController.navigateToLogin();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.pinkSherbet,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(context.width, 48),
      ),
      child: Text(
        "continue".tr,
        style: context.textStyles.bodyMedium
            ?.copyWith(color: context.onPrimaryColor),
      ),
    );
  }

  // slidable content builder
  /// return Column with image and texts.
  /// image is based on current index.
  /// texts are based on current index.
  Column _slidableContant(BuildContext context, int index) {
    return Column(
      children: [
        // save space for app bar
        const Spacer(),
        // onboarding image section supporting Slidable Content
        // image section with Obx to update image based on current index
        Container(
          // margin to apply figma design
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            // image is based on current index
            onboardingController.onboardImages[index],
            width: context.width,
            // this height to show full image without overflow
            height: 333,
            clipBehavior: Clip.none,
            fit: BoxFit.contain,
          ),
        ),

        // space between image and texts
        const SizedBox(height: 78),
        // space between texts and bottom section.
        /*
        const SizedBox(height: 24),
        // bottom section texts content with margin
        // to support Slidable Content
        Container(
            width: context.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            // texts section with Obx to update texts based on current index.
            child: ),*/
        // save space for bottom section
        const Spacer(),
      ],
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
          description: RichText(
            text: TextSpan(
              style: context.textStyles.bodyMedium,
              children: [
                TextSpan(text: "onboard1_description".tr),
                TextSpan(
                  text: "with_gravilog_we_turn_pregnancy_best_months".tr,
                  style: context.textStyles.bodyMedium?.copyWith(color: context.peachyPink),
                ),
              ],
            ),
          ),
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
          description: RichText(
            text: TextSpan(
              style: context.textStyles.bodyMedium,
              children: [
                TextSpan(text: "${"onboard3_description".tr}\t"),
                TextSpan(
                  text: url,
                  style: context.textStyles.bodyMedium?.copyWith(color: context.peachyPink),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch('https://$url'),
                ),
              ],
            ),
          ),
          showButtons: true,
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
        const SizedBox(height: 8),
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
                          ? BorderRadius.circular(8)
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
