import 'package:carousel_slider/carousel_slider.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/controllers/onboarding_controller.dart';
import 'package:gravilog_2025/featuers/questions/presentation/widgets/widgets.dart';

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
                (index) => _slidableContant(
                      context,
                      index,
                    ),
                context),
          ],
        ),
      ),
      // floating action button location to center docked
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Continue button at the bottom center and Stable .
      floatingActionButton: Container(
        // margin to apply figma design
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: _continueButton(context),
      ),
    );
  }

  // back button with arrow style and action
  IconButton _backButtonWithArrow(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        overlayColor: ColorManager.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.sp),
      icon: Icon(
        Icons.arrow_back,
        color: context.textPrimary,
        size: 24.sp,
      ),
      onPressed: () => Get.back(),
    );
  }

  // stable content builder
  Column _stableContant(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const HeightSpace(32),
        _buildIndicator(context),
        const HeightSpace(14),
        Container(
          width: context.width,
          height: 236.h,
          padding:
              EdgeInsets.only(left: 22.w, right: 22.w, top: 24.h, bottom: 32.h),
          // margin to apply figma design
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
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
  AppElevatedButton _continueButton(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        onboardingController.localDataSource.setOnBoardingScreenViewed();
        onboardingController.navigateToLogin();
      },
      text: "continue",
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
        const HeightSpace(154),
        // onboarding image section supporting Slidable Content
        // image section with Obx to update image based on current index
        Container(
          // margin to apply figma design
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: SvgPicture.asset(
            // image is based on current index
            onboardingController.onboardImages[index],
            width: context.width,
            // this height to show full image without overflow
            height: 324.h,
            clipBehavior: Clip.none,
            fit: BoxFit.contain,
          ),
        ),
        // space between image and texts
        const HeightSpace(78),
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
        //  const String url = 'gravilog.com';
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
        style: AppTextStyles.textStyle16bodyLarge400,
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
          style: AppTextStyles.kTextStyle20Pink700,
          textAlign: TextAlign.center,
        ),
        const HeightSpace(8),
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
              padding: EdgeInsets.symmetric(horizontal: 1.0.w),
              child: Container(
                // change width and shape based on current index
                width: onboardingController.currentIndex.value == entry.key
                    ? 32.0.sp
                    : 8.0.sp,
                height: 8.0.sp,
                margin: EdgeInsets.symmetric(horizontal: 2.0.w),
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
