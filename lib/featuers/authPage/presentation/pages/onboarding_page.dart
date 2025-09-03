import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/color_manager.dart';

class OnboardView extends StatelessWidget {
  OnboardView({super.key});

  final OnboardingController onboardingController = Get.find();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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

            _buildIndicator(),

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
                    return _buildOnboardingContent(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingContent(int index) {
    final model = onboardingController; // controller replaces ViewModel
    switch (index) {
      case 0:
        return _buildPage(
          image: onboardingController.onboardImages[0],
          title: AppStrings.onboard1Title.tr,
          description: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 2),
              children: [
                TextSpan(text: AppStrings.onboard1Description.tr),
                TextSpan(
                  text: AppStrings.withGravilogWeTurnPregnancyBestMonths.tr,
                  style: TextStyle(color: ColorManager.royalBlue),
                ),
              ],
            ),
          ),
        );
      case 1:
        return _buildPage(
          image: onboardingController.onboardImages[1],
          title: AppStrings.onboard2Title.tr,
          description: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 2),
              children: [
                TextSpan(text: AppStrings.onboard2Description.tr),
              ],
            ),
          ),
        );
      case 2:
        const url = 'www.gravilog.com';
        return _buildPage(
          image: onboardingController.onboardImages[2],
          title: AppStrings.onboard3Title.tr,
          description: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 2),
              children: [
                TextSpan(text: "${AppStrings.onboard3Description.tr}\t"),
                TextSpan(
                  text: url,
                  style: TextStyle(color: ColorManager.royalBlue),
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
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: ColorManager.hotPink,
              letterSpacing: 10 * 0.08),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        description,
        if (showButtons) ...[
          const SizedBox(height: 16),
          _buildButtons(),
        ],
      ],
    );
  }

  Widget _buildButtons() {
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
            AppStrings.signIn.tr,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => onboardingController.navigateToSignup(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              side: BorderSide(color: ColorManager.pinkSherbet, width: 0.5),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            AppStrings.createNewAccount.tr,
            style: const TextStyle(
              color: ColorManager.pinkSherbet,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() {
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
                  ? ColorManager.royalBlue2
                  : Colors.black.withOpacity(0.10),
            ),
          ),
        );
      }).toList(),
    ));
  }
}
