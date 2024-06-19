import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

double getSize(double size, BuildContext context) {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
      return _getSizePhone(size, MediaQuery.of(context).size);
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      return _getSizeDesktop(size, MediaQuery.of(context).size);
    case TargetPlatform.fuchsia:
      return size;
  }
}

double _getSizePhone(double fontSize, Size size) {
  double nSize = fontSize;
  double width = size.width;
  if (width < 320) {
    nSize = fontSize * 0.7;
  } else if (width > 320 && width <= 375) {
    nSize = fontSize * 0.8;
  } else if (width > 375 && width < 480) {
    nSize = fontSize * 0.9;
  } else if (width > 500 && width < 900) {
    nSize = fontSize * 1.1;
  } else {
    nSize = fontSize * 1.2;
  }
  return nSize;
}

double _getSizeDesktop(double fontSize, Size size) {
  return fontSize * 0.75;
}
