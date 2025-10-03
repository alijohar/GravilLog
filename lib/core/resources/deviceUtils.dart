import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gravilog_2025/core/resources/app_theme.dart';
import 'package:gravilog_2025/featuers/authPage/presentation/widgets/auth_elevated_button.dart';

class Deviceutils {
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static String getDeviceLanguage() {
    // Get the device's locale
    Locale deviceLocale = window.locale;

    // Access the language code (e.g., "en", "ar")
    return deviceLocale.languageCode;
  }

  static int getCurrentTimeInMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String convertMillisecondsToTime(int milliseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  static bool isToday(int milliseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    if (dateTime.year == DateTime.now().year) {
      if (dateTime.month == DateTime.now().month) {
        if (dateTime.day == DateTime.now().day) {
          return true;
        }
      }
    }
    return false;
  }

  static bool isSameDay(
    int time,
    int secondTime,
  ) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    DateTime secondDateTime = DateTime.fromMillisecondsSinceEpoch(secondTime);
    if (dateTime.year == secondDateTime.year) {
      if (dateTime.month == secondDateTime.month) {
        if (dateTime.day == secondDateTime.day) {
          return true;
        }
      }
    }
    return false;
  }

  static void showToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: CupertinoColors.black,
        textColor: CupertinoColors.white);
  }

  static void showCustomDialog(BuildContext context,
          {required String title,
          required String bodyText,
          required String buttonText,
          bool isDismissible = true,
          required void Function()? buttonAction}) =>
      showDialog(
          context: context,
          barrierDismissible: isDismissible,
          builder: (context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium!.copyWith(
                  color: context.pinkSherbet,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall,
              ),
              actions: [
                AuthElevatedButton(
                    onPressed: buttonAction,
                    child: Text(
                      buttonText,
                      style: context.textStyles.bodyMedium!.copyWith(
                          color: context.surfaceColor,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            );
          });

  static String replacePlaceholder(String message, Map<String, String> values) {
    values.forEach((key, value) {
      message = message.replaceFirst('{$key}', value);
    });
    return message;
  }
}
