class AppUrls {
  static String get _baseURL => "http://223.235.64.210:9091/erp-api-v1/";

  //-------------------------------------- actual urls --------------------------------------

  static String get mediaUpload => "${_baseURL}main/media/upload";

  static String get login => "${_baseURL}main/auth/login";

  static String get getUser => '${_baseURL}main/auth/get-user';

  static String get logout => '${_baseURL}main/auth/logout';

  static String get getRmListForAttendance {
    return '${_baseURL}app-rm/attendance/get-rm-list-for-attendance';
  }

  static String get getRmListForMobileLogin {
    return '${_baseURL}erp/staff/get-rm-list?is-mobile-login=true';
  }

  static String get getLocations {
    return '${_baseURL}app-rm/route-plan/get-locations';
  }

  static String get targetSummary {
    return '${_baseURL}app-rm/target-summary/monthly-summary';
  }
}
