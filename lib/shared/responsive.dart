import 'package:flutter/material.dart';

abstract class Responsive {
  static useLayoutExtraSmall(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide <= 320;
  }

  static useLayoutSmall(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 320 &&
        MediaQuery.of(context).size.shortestSide <= 360;
  }

  static useLayoutNormal(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 320 &&
        MediaQuery.of(context).size.shortestSide < 600;
  }

  static useLayoutTabSmall(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide > 600 &&
        MediaQuery.of(context).size.shortestSide < 900;
  }

  static useLayoutTabBig(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 900;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 650;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isLandScape(BuildContext context) =>
      (MediaQuery.of(context).orientation == Orientation.landscape);

  static double getSize(double size, BuildContext context) {
    // double nSize = size;
    //
    // double width = MediaQuery.of(context).size.width;
    // if (width < 320) {
    //   nSize = size * 0.7;
    // } else if (width > 320 && width <= 375) {
    //   nSize = size * 0.8;
    // } else if (width > 375 && width < 480) {
    //   nSize = size * 0.9;
    // } else if (width > 500 && width < 900) {
    //   nSize = size * 1;
    // }
    // return nSize;

    // immediate old - running code
    // double nSize = size;
    // double width = MediaQuery.of(context).size.width;
    // if (width <= 320) {
    //   nSize = size * 0.9;
    // } else if (width > 320 && width <= 375) {
    //   nSize = size * 0.8;
    // } else if (width > 375 && width < 480) {
    //   nSize = size * 0.9;
    // } else if (width > 500 && width < 900) {
    //   nSize = size * 1.1;
    // } else {
    //   nSize = size * 1.1;
    // }
    // return nSize;

    double nSize = size;

    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    double scaleFactor = MediaQuery.of(context).textScaleFactor;


    // old approch
    // if (width <= 320) {
    //   nSize = size *  0.7;
    // } else if (width > 320 && width <= 375) {
    //   nSize = size * 0.8;
    // } else if (width > 375 && width < 480) {
    //   nSize = size * 0.9;
    // } else if (width > 480) {
    //   nSize = size * 1.1;
    // }

// another approch
    // if (width <= 320) {
    //   // nSize = size * 0.7;
    //
    //   if (scaleFactor > 1) {
    //     nSize = size * 0.5;
    //   } else {
    //     nSize = size * 0.7;
    //   }
    // } else if (width > 320 && width <= 375) {
    //   // nSize = size * 0.8;
    //
    //   if (scaleFactor > 1) {
    //     nSize = size * 0.6;
    //   } else {
    //     nSize = size * 0.8;
    //   }
    // } else if (width > 375 && width < 480) {
    //   // nSize = size * 0.9;
    //
    //   if (scaleFactor > 1) {
    //     nSize = size * 0.7;
    //   } else {
    //     nSize = size * 0.9;
    //   }
    // } else if (width > 480) {
    //   // nSize = size * 1.1;
    //
    //   if (scaleFactor > 1) {
    //     nSize = size * 0.8;
    //   } else {
    //     nSize = size * 1.1;
    //   }
    // }

    if (scaleFactor > 1) {
      if (width <= 320) {
        nSize = size * 0.5;
      } else if (width > 320 && width <= 375) {
        nSize = size * 0.6;
      } else if (width > 375 && width < 480) {
        nSize = size * 0.7;
      } else if (width > 480) {
        nSize = size * 8;
      }
    } else {
      if (width <= 320) {
        nSize = size * 0.7;
      } else if (width > 320 && width <= 375) {
        nSize = size * 0.8;
      } else if (width > 375 && width < 480) {
        nSize = size * 0.9;
      } else if (width > 480) {
        nSize = size * 1;
      }
    }
    return nSize;
  }
}
