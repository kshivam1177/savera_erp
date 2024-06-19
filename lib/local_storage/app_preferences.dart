import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static Future<SharedPreferences> _init() async {
    final pref = await SharedPreferences.getInstance();
    await pref.reload();
    return pref;
  }

  //------------------------------------------------- BOOLEAN --------------------------------------------------------------------
  static Future<bool> getBoolean(String key) async {
    final pref = await _init();
    return pref.getBool(key) ?? false;
  }

  static Future<bool> setBoolean(String key, bool value) async {
    final pref = await _init();
    return await pref.setBool(key, value);
  }

  //------------------------------------------------- STRING ---------------------------------------------------------------------
  static Future<String> getString(String key) async {
    final pref = await _init();
    return pref.getString(key) ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    final pref = await _init();
    return await pref.setString(key, value);
  }

  //------------------------------------------------- INT ------------------------------------------------------------------------
  static Future<int> getInt(String key) async {
    final pref = await _init();
    return pref.getInt(key) ?? 0;
  }

  static Future<bool> setInt(String key, int value) async {
    final pref = await _init();
    return await pref.setInt(key, value);
  }

  //------------------------------------------------- DOUBLE ---------------------------------------------------------------------

  static Future<bool> setDouble(String key, double value) async {
    final pref = await _init();
    return await pref.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    final pref = await _init();
    return pref.getDouble(key) ?? 0.0;
  }

  //------------------------------------------------- CLEAR ALL ------------------------------------------------------------------
  static Future<void> clearPreference() async {
    final pref = await _init();
    await pref.clear();
  }

  //------------------------------------------------- REMOVE ---------------------------------------------------------------------
  static void removePreference(String key) async {
    final SharedPreferences prefs = await _init();
    prefs.remove(key);
  }
}
