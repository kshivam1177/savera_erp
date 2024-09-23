import 'package:flutter/foundation.dart';

class DeviceInfo {
  static bool get isDeviceIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static String get platformName {
    if (kIsWeb) return "WEB_ERP";
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        return "APP_ERP";
      default:
        return "WEB_ERP";
    }
  }
}
