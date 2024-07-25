import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart' as ul;

abstract class Helpers {
  static bool ensureBackgroundInit() {
    if (RootIsolateToken.instance == null) {
      debugPrint("RootIsolateToken.instance==null");
      return false;
    }
    BackgroundIsolateBinaryMessenger.ensureInitialized(
      RootIsolateToken.instance!,
    );
    return true;
  }

  static T? enumFromString<T>(Iterable<T> values, String? value) {
    try {
      return values.firstWhere((T type) {
        final val = type.toString().split(".").last.toLowerCase();
        return val == value?.toLowerCase();
      });
    } catch (e) {
      return null;
    }
  }

  static Future<bool> launchUrl(
    Uri uri, {
    ul.LaunchMode mode = ul.LaunchMode.platformDefault,
  }) async {
    if (await ul.canLaunchUrl(uri)) {
      await ul.launchUrl(uri, mode: mode);
      return true;
    }
    return false;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> hideKeyboardWithChannel() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

// static void toast(
//   String msgToDisplay, {
//   bool isError = false,
//   Toast? toastLength,
// }) {
//   Fluttertoast.showToast(
//     msg: msgToDisplay,
//     toastLength: toastLength ?? Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: isError ? Colors.red : Colors.black26,
//     textColor: isError ? Colors.white : Colors.black,
//     fontSize: 16.0,
//     webBgColor: isError ? "linear-gradient(to right, #dc1c13, #dc1c13)" : "linear-gradient(to right, #4C988C, #00BCD4)",
//     webPosition: "right",
//   );
// }
  static void toast(
    BuildContext context, {
    required String msg,
    String? description,
    ToastificationType type = ToastificationType.success,
    Duration? duration,
  }) {
    Toastification().show(
      context: context,
      title: Text(msg),
      description: description != null ? Text(description) : null,
      type: type,
      overlayState: Overlay.of(context),
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration ?? Duration(seconds: 2),
// progressBarTheme: ProgressIndicatorThemeData(
//   color: Colors.green,
//   linearTrackColor: Colors.red,
//   linearMinHeight: 1,
//   circularTrackColor: Colors.blue,
//   refreshBackgroundColor: Colors.yellow,
// ),
    );
  }

  static String getGreetingText() {
    String wText = "";
    DateTime c = DateTime.now();
    int timeOfDay = c.hour;

    if (timeOfDay >= 0 && timeOfDay < 12) {
      wText = "Good Morning";
    } else if (timeOfDay >= 12 && timeOfDay < 16) {
      wText = "Good Afternoon";
    } else if (timeOfDay >= 16 && timeOfDay < 21) {
      wText = "Good Evening";
    } else if (timeOfDay >= 21 && timeOfDay < 24) {
      wText = "Good Night";
    }
    return wText;
  }

  static Future<bool> isInternetPresentOld() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//  print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
//print('not connected');
      return false;
    }
  }

  static Future<bool> isInternetPresent() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        return true;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        return true;
      } else {
// print("Unable to connect. Please Check Internet Connection");
        return await isInternetPresentOld();
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isValidEmail(String text) {
    final regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regExp.hasMatch(text);
  }
}
