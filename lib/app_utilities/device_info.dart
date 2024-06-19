import 'package:flutter/foundation.dart';

class DeviceInfo {
  static bool get isDeviceIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static String get platformName {
    return defaultTargetPlatform == TargetPlatform.iOS ? "IOS" : "ANDROID";
  }

  static getDeviceIMEI() async => "ImeiPlugin.getImei";
}
