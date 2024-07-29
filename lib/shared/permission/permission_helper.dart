import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:savera_erp/shared/app_messages.dart';
import 'package:savera_erp/ui/widgets/dailog/common_dialog.dart';

class PermissionHelper {

  static Future<bool> checkForCameraPermission() async {
    return requestPermission(Permission.camera);
  }

  static Future<bool> checkForPhonePermission() async {
    /// It is used to get IMEI number
    if (Platform.isAndroid) {
      return requestPermission(Permission.phone);
    }
    return true;
  }

  static Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    }
    final state = await permission.request();
    return state.isGranted;
  }

  static Future<PermissionState> permissionStates(Permission permission) async {
    if (await permission.isGranted) {
      return PermissionState.granted;
    } else if (await permission.isDenied) {
      return PermissionState.requestNow;
    } else if (await permission.isPermanentlyDenied) {
      return PermissionState.openSetting;
    } else if (await permission.isRestricted) {
      return PermissionState.openSetting;
    } else if (await permission.isLimited) {
      return PermissionState.openSetting;
    } else if (await permission.isProvisional) {
      return PermissionState.openSetting;
    } else {
      return PermissionState.requestNow;
    }
  }

  static Future<bool> openLocationDialog(BuildContext context) async {
    return await commonDialog(
      context,
      AppMessages.locationMsg,
      title: AppMessages.locationMsgTitle,
      positiveBtnText: "Open Settings",
      positiveCallback: openAppSettings,
// negativeCallback: () => false,
    );
  }
}

enum PermissionState {
  granted,
  requestNow,
  openSetting,
}
