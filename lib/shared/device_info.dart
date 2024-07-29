import 'dart:io';

import 'package:flutter/foundation.dart';

class DeviceInfo {
  static bool get isDeviceIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static String get platformName {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return "RM_IOS";
      case TargetPlatform.android:
        return "RM_ANDROID";
      default:
        // return "RM_WEB";
        return "RM_ANDROID";
    }
  }

  static getDeviceIMEI() async => "ImeiPlugin.getImei";

  static Future<String> getDeviceName() async {
    String receivedDeviceName = "";
    if (Platform.isAndroid) {
      // final osDetails = await UtilsChannel().getOsDetail();
      // if (osDetails.containsKey("device")) {
      //   receivedDeviceName += osDetails["device"];
      // }
      // if (osDetails.containsKey("brand")) {
      //   receivedDeviceName += osDetails["brand"];
      // }
      // if (osDetails.containsKey("brandModel")) {
      //   receivedDeviceName += osDetails["brandModel"];
      // }
      // if (osDetails.containsKey("brandManufacturer")) {
      //   receivedDeviceName += osDetails["brandManufacturer"];
      // }
    }

    debugPrint('[ Running on Device : $receivedDeviceName ]');
    return receivedDeviceName;
  }
}
