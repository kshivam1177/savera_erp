class AppMessages {
  static String get getNoInternetMsg => "Internet not available.";

  static String get pleaseTryAgain => "Please try again";

  static String get cameraPermission => "Please allow camera permission";

  static String get storagePermission => "Please allow storage permission";

  static String get locationMsg {
    return "Please allow background location permission";
  }
  static String get locationMsgTitle {
    return "Permission Required";
  }


  static String get serverHavingIssue {
    return "Server is having some issue, $pleaseTryAgain";
  }

  static String get serverHavingIssueV2 {
    return "Server is having some issue, $pleaseTryAgain after some time";
  }

  static String get somethingWentWrong =>
      "Something went wong, $pleaseTryAgain";

  static String get requestCancelled => "Request Cancelled";

  static String get connectionFailed => "Connection Failed";
}
