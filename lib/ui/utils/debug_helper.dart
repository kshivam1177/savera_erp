import 'package:flutter/foundation.dart';

/*
* Use it to print error/log msg's.
* */

void dxLog(String logMsg, {String logAt = "", String fileName = ""}) {
  if (kDebugMode) {
    print("""
      ---------- CBO FMR LOG ---------------
      File Name: $fileName
      Function/Class: $logAt
      --------------***-----------------
      MESSAGE:  ->  $logMsg
      ----------------------------------
      """);
  }
}
