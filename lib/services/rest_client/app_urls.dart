class AppUrls {
  // static String get _baseURL => "https://saverainterio.in/erp-api-v1/";
  static String get _baseURL => "localhost/erp-api-v1/";

  //-------------------------------------- actual urls --------------------------------------

  static String get mediaUpload => "${_baseURL}main/media/upload";

  static String get login => "${_baseURL}main/auth/login";

  static String get createUser => "${_baseURL}main/auth/register-user";

  static String get setInactive =>
      "${_baseURL}main/auth/toggle-active-inactive";

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

  static String get getRmWiseVisits {
    return '${_baseURL}app-rm/route-plan/get-rm-wise-visits';
  }

  static String get getRmVisitsDetail {
    return '${_baseURL}app-rm/route-plan/get-rm-visits';
  }
}
