import 'dart:convert';

import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';

import 'app_preferences.dart';

class PrefHandler {
  static const String _user = 'user_info';
  static const String _loginId = 'login_id';
  static const String _userId = 'user_id';
  static const String _loginDate = 'login_date';

  PrefHandler._();

  static Future<bool> isLoggedIn() async {
    final user = await getAuthResult();
    if (user.loginId > 0) {
      final loginDate = await _getLoginDate();
      if (loginDate != null) {
        final diff = DateTime.now().difference(loginDate).inDays;
        return diff <= 7;
      }
    }
    return false;
  }

  static Future<void> _setLoginDate() async {
    await AppPreference.setString(
      _loginDate,
      DxDateUtils.getDateString(DateTime.now()),
    );
  }

  static Future<DateTime?> _getLoginDate() {
    return AppPreference.getString(_loginDate).then((value) {
      return DxDateUtils.getDateTimeFromString(value);
    });
  }

  static Future<void> setLoginId(int userId) async {
    await AppPreference.setInt(_loginId, userId);
  }

  static Future<int> getLoginId() => AppPreference.getInt(_loginId);

  static Future<void> setUserId(int userId) async {
    await AppPreference.setInt(_userId, userId);
  }

  static Future<int> getUserId() => AppPreference.getInt(_userId);

  static Future<void> setAuthResult(AuthResult user) async {
    await _setLoginDate();
    await AppPreference.setString(
      _user,
      jsonEncode(user.toMap()),
    );
  }

  static Future<AuthResult> getAuthResult() async {
    final json = await AppPreference.getString(_user);
    if (json.isEmpty) return AuthResult.guest();
    return AuthResult.fromMap(jsonDecode(json));
  }

  //=====================================================
  static Future<void> clearPref() async {
    await AppPreference.clearPreference();
  }
}
