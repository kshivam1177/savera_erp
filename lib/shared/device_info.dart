import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
