import 'dart:core';

class DxDateUtils {
  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0, 0);
  }

  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */

    final d1 = DateTime(date1.year, date1.month, date1.day);
    final d2 = DateTime(date2.year, date2.month, date2.day);
    return d1.compareTo(d2) == 0;
  }

  static DateTime? getDateTimeFromString(String dateString) {
    // Example format: "2024-06-30 14:30:00"
    try {
      // Split the date-time string if it contains both date and time parts
      List<String> parts = dateString.split(' ');

      // Extract date and time components
      List<String> dateParts = parts[0].split('-');
      int year = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int day = int.parse(dateParts[2]);

      int hour = 0;
      int minute = 0;
      int second = 0;

      // Check if there is a time part
      if (parts.length > 1) {
        List<String> timeParts = parts[1].split(':');
        hour = int.parse(timeParts[0]);
        minute = int.parse(timeParts[1]);
        second = int.parse(timeParts[2]);
      }

      // Create and return DateTime object
      return DateTime(year, month, day, hour, minute, second);
    } catch (e) {
      // Handle any errors such as invalid format
      print('Error parsing date-time string: $e');
      return null; // Or throw an exception based on your application logic
    }
  }

  static String getDateTimeString(DateTime dateTime) {
    return dateTime.toString().split(".").first;
  }

  static String getDateString(DateTime dateTime) {
    return dateTime.toString().split(" ").first;
  }

  static String getFormattedDate(
    DateTime now, {
    bool isYMD = false,
    bool isSlashed = true,
    bool returnBlankIfNull = false,
  }) {
    DateTime dateReceived = now;

    String ll = isSlashed
        ? (isYMD
            ? "${dateReceived.year}/${dateReceived.month > 9 ? dateReceived.month : "0${dateReceived.month}"}/${dateReceived.day > 9 ? dateReceived.day : "0${dateReceived.day}"}"
            : "${dateReceived.day > 9 ? dateReceived.day : "0${dateReceived.day}"}/${dateReceived.month > 9 ? dateReceived.month : "0${dateReceived.month}"}/${dateReceived.year}")
        : (isYMD
            ? "${dateReceived.year}-${dateReceived.month > 9 ? dateReceived.month : "0${dateReceived.month}"}-${dateReceived.day > 9 ? dateReceived.day : "0${dateReceived.day}"}"
            : "${dateReceived.day > 9 ? dateReceived.day : "0${dateReceived.day}"}-${dateReceived.month > 9 ? dateReceived.month : "0${dateReceived.month}"}-${dateReceived.year}");

    if (returnBlankIfNull) {
      return "";
    } else {
      return ll;
    }
  }

  static String getCurrent24Time({DateTime? now}) {
    now ??= DateTime.now();
    List<String> dSplits = now.toString().split(" ");
    List<String> tSplits = dSplits[1].split(":");
    final fTime = "${tSplits[0]}.${tSplits[1]}";
    return fTime;
  }

  static String getWeekDay(DateTime dateTime) => <String>[
        "MONDAY",
        "TUESDAY",
        "WEDNESDAY",
        "THURSDAY",
        "FRIDAY",
        "SATURDAY",
        "SUNDAY"
      ][dateTime.weekday - 1];

  static DateTime get00Date() {
    return DateTime(0000);
  }

  static DateTime currDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String getMonthName(
    int month, {
    bool short = false,
  }) {
    String name = "";
    switch (month) {
      case 1:
        name = "January";
        break;
      case 2:
        name = "February";
        break;
      case 3:
        name = "March";
        break;
      case 4:
        name = "April";
        break;
      case 5:
        name = "March";
        break;
      case 6:
        name = "June";
        break;
      case 7:
        name = "July";
        break;
      case 8:
        name = "August";
        break;
      case 9:
        name = "September";
        break;
      case 10:
        name = "October";
        break;
      case 11:
        name = "November";
        break;
      case 12:
        name = "December";
        break;
      default:
        name = "";
        break;
    }
    if (short && name.isNotEmpty) {
      return name.substring(0, 3);
    }
    return name;
  }
}
