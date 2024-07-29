class AppUrls {
  static String get _baseURL => "http://223.235.64.210:9091/erp-api-v1/";

  //-------------------------------------- actual urls --------------------------------------

  static String get mediaUpload => "${_baseURL}main/media/upload";

  static String get login => "${_baseURL}main/auth/login";

  static String get checkPhone => "${_baseURL}main/auth/check-phone";

  static String get verifyPhone => "${_baseURL}main/auth/verify-phone";

  static String get registerUser => '${_baseURL}main/auth/register-user';

  static String get getUser => '${_baseURL}main/auth/get-user';

  static String get logout => '${_baseURL}main/auth/logout';

  static String get deleteAccount => '${_baseURL}main/auth/delete-account';

  static String get addLocation => '${_baseURL}app-rm/route-plan/add-location';

  static String get getLocations {
    return '${_baseURL}app-rm/route-plan/get-locations';
  }

  static String get punchIn => '${_baseURL}app-rm/attendance/punch-in';

  static String get punchOut => '${_baseURL}app-rm/attendance/punch-out';

  static String get routePlanPopulate {
    return '${_baseURL}app-rm/route-plan/populate';
  }

  static String get targetSummary {
    return '${_baseURL}app-rm/target-summary/monthly-summary';
  }

  //=====================================================================
  static String get getProductImagesUrl {
    return '${_baseURL}products/catalog';
  }

  static String get getProductListUrl {
    return '${_baseURL}products/list';
  }

  static String get addUpdateCartUrl {
    return '${_baseURL}cart/commit';
  }

  static String get getAllCartItemsUrl {
    return '${_baseURL}cart/list';
  }

  static String get deleteCartItemUrl {
    return '${_baseURL}cart/delete';
  }

  static String get ledgerReportUrl {
    return '${_baseURL}ledger/ledgerReport';
  }

  static String get ledgerPointReportUrl {
    return '${_baseURL}ledger/ledgerPointReport';
  }

  static String get walletLedgerReportUrl {
    return '${_baseURL}ledger/walletLedgerReport';
  }

  static String get homeDataUrl {
    return '${_baseURL}other/dealerHomepageDetail';
  }

  static String get getMyOrderDetailUrl {
    return '${_baseURL}saleOrder/detail';
  }

  static String get submitNewSaleOrderUrl {
    return '${_baseURL}saleOrder/addSale';
  }

  static String get cancelSaleOrderUrl {
    return '${_baseURL}saleOrder/cancel';
  }

  static String get getMyOrderUrl {
    return '${_baseURL}saleOrder/list';
  }
}
