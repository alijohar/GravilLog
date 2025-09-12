import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gravilog_2025/core/resources/color_manager.dart';
import 'package:gravilog_2025/core/resources/deviceUtils.dart';
import 'package:gravilog_2025/core/resources/strings_manager.dart';
import 'package:intl/intl.dart';

import '../../../authPage/presentation/widgets/loader.dart';
import '../../data/models/pregnant_info_model.dart';
import '../controllers/expect_delivery_controller.dart';

class ExpectDeliveryView extends StatelessWidget {


   ExpectDeliveryView({
    super.key,

  });

  final ExpectDeliveryController controller = Get.find();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          leading: const BackButton()),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/pregnant-women.png'),
                Text(
                  AppStrings.expectedDueDate.tr,
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
                  AppStrings.daysUntilBirth.tr,
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
                    AppStrings.days.tr,
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
                      AppStrings.followUp.tr,
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
