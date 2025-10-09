import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/color_manager.dart';

class OnboardView extends StatelessWidget {
  OnboardView({super.key});

  final OnboardingController onboardingController = Get.find();



  @override
  Widget build(BuildContext context) {
    return context.gradientScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Obx(() => Image.asset(
                onboardingController.onboardImages[onboardingController.currentIndex.value],
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.contain,
              )),

            _buildIndicator(context),

              Expanded(
                child: CarouselSlider.builder(
                  itemCount:  onboardingController.onboardImages.length,
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    height: double.infinity,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      onboardingController.currentIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return _buildOnboardingContent(index, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingContent(int index, BuildContext context) {
    final model = onboardingController; // controller replaces ViewModel
    switch (index) {
      case 0:
        return _buildPage(
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
        return _buildPage(
          context: context,
          image: onboardingController.onboardImages[1],
          title: "onboard2_title".tr,
          description: RichText(
            text: TextSpan(
              style: context.textStyles.bodyMedium,
              children: [
                TextSpan(text: "onboard2_description".tr),
              ],
            ),
          ),
        );
      case 2:
        const url = 'www.gravilog.com';
        return _buildPage(
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

  Widget _buildPage({
    required BuildContext context,
    required String image,
    required String title,
    required RichText description,
    bool showButtons = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
         title,
          style: context.textStyles.headlineLarge?.copyWith(color: context.hotPink),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        description,
        if (showButtons) ...[
          const SizedBox(height: 16),
          _buildButtons(context),
        ],
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => onboardingController.navigateToLogin(),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.pinkSherbet,
            shape: const BeveledRectangleBorder(),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            "sign_in".tr,
            style: context.textStyles.bodyMedium?.copyWith(color: context.onPrimaryColor),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onboardingController.navigateToSignup(),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.surfaceColor,
            shape: BeveledRectangleBorder(
              side: BorderSide(color: context.pinkSherbet, width: 0.5),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            "create_new_account".tr,
            style: context.textStyles.bodyMedium?.copyWith(color: context.pinkSherbet),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: onboardingController.onboardImages.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: onboardingController.currentIndex.value == entry.key
                  ? context.secondaryColor
                  : context.onSurfaceColor.withOpacity(0.10),
            ),
          ),
        );
      }).toList(),
    ));
  }
}
