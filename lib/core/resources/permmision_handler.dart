import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class PermissionStorageHandler {
  static Future<bool> checkPermissions() async {
    if (Platform.isIOS) {
      return await handleIosPermission();
    } else if (Platform.isAndroid) {
      return await handleAndroidPermission();
    } else {
      return false;
    }
  }

  static Future<bool> handleAndroidPermission() async {
    PermissionStatus permissionStatus;
    final isEqualOrHigher32 = await isEqualOrHigher32SDKVersion();

    if (isEqualOrHigher32) {
      final photosPermission = await Permission.photos.request();
      final videosPermission = await Permission.videos.request();

      if (photosPermission.isPermanentlyDenied ||
          videosPermission.isPermanentlyDenied) {
        return false;
      }
      return photosPermission.isGranted && videosPermission.isGranted;
    } else {
      permissionStatus = await Permission.storage.request();

      if (permissionStatus.isPermanentlyDenied) {
        return false;
      }
      return permissionStatus.isGranted;
    }
  }

  static Future<bool> handleIosPermission() async {
    if (await Permission.photos.isGranted) {
      return true;
    } else if (await Permission.photos.isPermanentlyDenied) {
      _showCustomCupertinoDialog(
        title: 'permission_required'.tr,
        description: 'ios_permission_message'.tr,
      );
      return false;
    } else {
      PermissionStatus permissionStatus = await Permission.photos.request();
      if (permissionStatus.isGranted) {
        return true;
      } else if (permissionStatus.isPermanentlyDenied) {
        _showCustomCupertinoDialog(
          title: 'permission_required'.tr,
          description: 'ios_permission_message'.tr,
        );
      }
    }
    return false;
  }

  static void _showPermissionDialog(String message) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text("permission_required".tr),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("cancel".tr),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text("go_to_settings".tr),
          ),
        ],
      ),
    );
  }

  static void _showCustomCupertinoDialog({
    required String title,
    required String description,
  }) {
    showCupertinoDialog<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('cancel'.tr),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text('go_to_settings'.tr),
          ),
        ],
      ),
    );
  }

  static Future<bool> isEqualOrHigher32SDKVersion() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt >= 32;
    }
    return false;
  }
}
