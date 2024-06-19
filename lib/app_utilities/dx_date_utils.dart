import 'dart:core';

class DxDateUtils {
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

  //Use
  static DateTime? cnvtToDateObject(
    String dateString, {
    bool isDcrDate = false,
  }) {
    //dcr data case => month/day/year
    //non dcr date case => day/month/year
    //timeStamp case =>  "2021-04-30T00:00:00"
    bool isTimeStamp = dateString.contains("T");
    dateString = dateString.split("T").first;

    int monthPos = 1;
    int dayPos = 0;
    int yearPos = 2;

    int day, month, year;

    if (dateString.isNotEmpty && !isTimeStamp) {
      if (dateString.contains("/")) {
        List<String> splitted = dateString.split("/");
        year = int.parse(splitted[yearPos]);
        month = int.parse(splitted[monthPos]);
        day = int.parse(splitted[dayPos]);
      } else {
        //expected
        List<String> splitted = dateString.split("-");
        year = int.parse(splitted[yearPos]);
        month = int.parse(splitted[monthPos]);
        day = int.parse(splitted[dayPos]);
      }
      return DateTime(year, month, day);
    } else if (isTimeStamp) {
      List<String> splitted = dateString.split("-");
      year = int.parse(splitted[0]);
      month = int.parse(splitted[1]);
      day = int.parse(splitted[2]);
      return DateTime(year, month, day);
    } else {
      return null;
    }
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
}
