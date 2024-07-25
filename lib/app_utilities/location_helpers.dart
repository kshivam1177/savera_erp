import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationHelpers {
  static int calculateNumberOfDeltas(double distance) {
    int delta = (distance * 1000) ~/ 10;
    print("distance [$distance] <>  delta [$delta]");

    // int numDeltas = 80; // default
    if (delta == 0) {
      return 1;
    }
    return delta;
  }

  static double roundDistance(double distance, {int decimalPlaces = 1}) {
    // Convert the number to a string
    String valueStr = distance.toString();

    // Find the position of the decimal point
    int decimalIndex = valueStr.indexOf('.');

    if (decimalIndex != -1) {
      // Extract the integer part (left of decimal)
      String integerPart = valueStr.substring(0, decimalIndex);

      int rightStartIndex = decimalIndex + 1;
      int rightEndIndex = decimalIndex + 1 + decimalPlaces;

      // Get the first character to the right of the decimal
      String right = valueStr.substring(rightStartIndex, rightEndIndex);

      return double.parse("${integerPart}.${right}");
    } else {
      return distance.toDouble();
    }
  }

  static double calculateDistance(LatLng loc1, LatLng loc2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((loc2.latitude - loc1.latitude) * p) / 2 +
        c(loc1.latitude * p) *
            c(loc2.latitude * p) *
            (1 - c((loc2.longitude - loc1.longitude) * p)) /
            2;
    double originalDistance = 12742 * asin(sqrt(a));
    return roundDistance(originalDistance, decimalPlaces: 2);
  }
}
