import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';

import '../../data/models/pregnant_info_model.dart';
import '../controllers/pregnet_controller.dart';


class PregnantQuestionView extends StatelessWidget {
  const PregnantQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    PregnantQuestionController controller = Get.find();
    controller.startupLogic();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.areYou.tr,
                style: TextStyle(
                  fontWeight: Theme.of(context).textTheme.displayMedium?.fontWeight,
                  fontSize: 20,
                  letterSpacing: 20 * 0.08,
                ),
              ),
              const SizedBox(height: 50),

              // Pregnant options
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption(
                    context,
                    image: 'assets/images/pregnant.png',
                    label: AppStrings.pregnant.tr.toUpperCase(),
                    selected: controller.isPregnant.value == Pregnant.Is_Pregnant,
                    onTap: () => controller.setPregnant(Pregnant.Is_Pregnant),
                  ),
                  _buildOption(
                    context,
                    image: 'assets/images/not_pregnant.png',
                    label: AppStrings.notPregnant.tr.toUpperCase(),
                    selected: controller.isPregnant.value == Pregnant.Not_Pregnant,
                    onTap: () => controller.setPregnant(Pregnant.Not_Pregnant),
                  ),
                ],
              )),
              const Spacer(),

              // Confirm button
              ElevatedButton(
                onPressed: controller.onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.pinkSherbet,
                  shape: const BeveledRectangleBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.confirm.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required String image,
        required String label,
        required bool selected,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontWeight: Theme.of(context).textTheme.displayMedium?.fontWeight,
              fontSize: 14,
              letterSpacing: 20 * 0.08,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? ColorManager.royalBlue : ColorManager.lightGray,
            ),
            child: const Center(
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

