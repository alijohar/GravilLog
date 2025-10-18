import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:intl/intl.dart';

import '../../../authPage/presentation/widgets/loader.dart';
import '../controllers/expect_delivery_controller.dart';

class ExpectDeliveryView extends StatelessWidget {


   ExpectDeliveryView({
    super.key,

  });

  final ExpectDeliveryController controller = Get.find();


  @override
  Widget build(BuildContext context) {


    return context.gradientScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/pregnant-women.png'),
                Text(
                  "expected_due_date".tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.fontWeight,
                    letterSpacing: 18 * 0.08,
                    color: ColorManager.pinkSherbet,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Obx(() => Text(
                  DateFormat('dd-MM-yyyy').format(controller.deliveryDate.value.toLocal()),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.fontWeight,
                    letterSpacing: 18 * 0.08,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 40),
                Text(
                  "days_until_birth".tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.fontWeight,
                    letterSpacing: 18 * 0.08,
                    color: ColorManager.pinkSherbet,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Obx(() => Text(
                  Deviceutils.replacePlaceholder(
                    "days".tr,
                    {'s': controller.getRemainingDays().toString()},
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.fontWeight,
                    letterSpacing: 18 * 0.08,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Obx(() => ElevatedButton(
                onPressed: () => controller.onFollowUp(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.pinkSherbet,
                  shape: const BeveledRectangleBorder(),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: controller.loading.value
                    ? Loader(duration: const Duration(milliseconds: 600))
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "follow_up".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        letterSpacing: 17 * 0.08,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.fontWeight,
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
