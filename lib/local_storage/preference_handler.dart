import 'dart:convert';

import 'package:savera_erp/app_utilities/app_constants.dart';
import 'package:savera_erp/models/auth_result.model.dart';

import 'app_preferences.dart';

class PrefHandler {
  PrefHandler._();

  static Future<bool> isLoggedIn() async {
    final user = await getAuthResult();
    return user.loginId > 0;
  }

  static Future<void> setLoginId(int userId) async {
    await AppPreference.setInt(AppConstants.loginId, userId);
  }

  static Future<int> getLoginId() => AppPreference.getInt(AppConstants.loginId);

  static Future<void> setUserId(int userId) async {
    await AppPreference.setInt(AppConstants.userId, userId);
  }

  static Future<int> getUserId() => AppPreference.getInt(AppConstants.userId);

  static Future<void> setAuthResult(AuthResult user) async {
    await AppPreference.setString(
      AppConstants.user,
      jsonEncode(user.toMap()),
    );
  }

  static Future<AuthResult> getAuthResult() async {
    final json = await AppPreference.getString(AppConstants.user);
    if (json.isEmpty) return AuthResult.guest();
    return AuthResult.fromMap(jsonDecode(json));
  }

  //=====================================================
  static Future<void> clearPref() async {
    await AppPreference.clearPreference();
  }
}
