class AppAuth {
  static String get appTraceReceiverEmail => "palangindustries@gmail.com";

  static String get appMailerEmail => "palangindustries@gmail.com";

  static String get appMailerPassword => "palan@2014";
}

class AppConstants {
  static const String textRegular = 'MontserratRegular';
  static const String textBold = 'MontserratBold';
  static const String textSemiBold = 'MontserratSemiBold';

  static const String userPic = 'user_pic';
  static const String user = 'user_info';
  static const String loginId = 'login_id';
  static const String userId = 'user_id';

  //-------------------------------------- base url --------------------------------------

  static String get _baseURL => "http://palang.in:2555/mob-api-v10/mobile/";

  static String get _authBaseURL => "http://palang.in:2555/mob-api-v10/main/";

  //-------------------------------------- actual urls --------------------------------------

  static String get profileImageUpload {
    return 'http://palang.in:2555/mob-api-v5/common/media/upload';
  }

  static String get loginUrl => "${_authBaseURL}auth/login";

  static String get signupExistingeUrl => '${_authBaseURL}auth/signupExisting';

  static String get validateMobileUrl {
    return '${_baseURL}userauth/validateMobileToCreateLogin';
  }

  static String get validateUserNameForgetPWD {
    return '${_authBaseURL}userauth/validateUserName';
  }

  static String get updateLoginPassword {
    return '${_authBaseURL}userauth/updateLoginPassword';
  }

  static String get sendOTPToRegisteredMobile {
    return '${_authBaseURL}userauth/sendOTPToRegisteredUser';
  }

  static String get sendOTPToNumberURL {
    return '${_baseURL}userauth/sendOTPToNumber';
  }

  static String get profileUpdateURL {
    return '${_baseURL}userauth/update';
  }

  static String get logoutUrl {
    return '${_baseURL}userauth/logout';
  }

  static String get getDistributerURL {
    return '${_baseURL}userauth/getDistributer';
  }

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
