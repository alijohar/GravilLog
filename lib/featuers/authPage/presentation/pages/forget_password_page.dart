import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';

import '../controllers/forget_password_controller.dart';
import '../widgets/loader.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
     ForgetPasswordController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
    backgroundColor: Colors.transparent,

      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgotPassword.tr,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: Theme.of(context).textTheme.displayMedium?.fontWeight,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.email.tr,
                            style: TextStyle(
                              fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
                              fontSize: 14,
                              letterSpacing: 14 * 0.02,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: controller.emailController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight,
                                fontSize: 14,
                                letterSpacing: 14 * 0.02,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF8F7F7),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(
                    () => ElevatedButton(
                  onPressed: controller.hasEmail.value
                      ? () => controller.resetPassword(context)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.pinkSherbet,
                    shape: const BeveledRectangleBorder(),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: controller.loading.value
                      ? const Loader(duration: Duration(milliseconds: 600))
                      : Text(
                    AppStrings.continueBtn.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: Theme.of(context).textTheme.displayMedium?.fontWeight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
