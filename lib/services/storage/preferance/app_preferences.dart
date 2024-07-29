import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.reload();
    return;
  }

  //------------------------------------------------- BOOLEAN --------------------------------------------------------------------
  static Future<bool> getBoolean(String key) async {
    return _preferences!.getBool(key) ?? false;
  }

  static Future<bool> setBoolean(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  //------------------------------------------------- STRING ---------------------------------------------------------------------
  static Future<String> getString(String key) async {
    // final pref = await _init();
    return _preferences!.getString(key) ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    // final pref = await _init();
    return await _preferences!.setString(key, value);
  }

  //------------------------------------------------- INT ------------------------------------------------------------------------
  static Future<int> getInt(String key) async {
    // final pref = await _init();
    return _preferences!.getInt(key) ?? 0;
  }

  static Future<bool> setInt(String key, int value) async {
    // final pref = await _init();
    return await _preferences!.setInt(key, value);
  }

  //------------------------------------------------- DOUBLE ---------------------------------------------------------------------

  static Future<bool> setDouble(String key, double value) async {
    // final pref = await _init();
    return await _preferences!.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    // final pref = await _init();
    return _preferences!.getDouble(key) ?? 0.0;
  }

  //------------------------------------------------- STRING ---------------------------------------------------------------------
  static Map<String, dynamic> getMap(String key)  {
    // final pref = await _init();
    final val = _preferences!.getString(key) ?? "";
    if (val.isEmpty) return {};
    return Map<String, dynamic>.from(jsonDecode(val));
  }

  static Future<bool> setMap(String key, Map<String, dynamic> value) async {
    // final pref = await _init();
    return await _preferences!.setString(key, jsonEncode(value));
  }

  //------------------------------------------------- CLEAR ALL ------------------------------------------------------------------
  static Future<void> clearPreference() async {
    // final pref = await _init();
    await _preferences!.clear();
  }

  //------------------------------------------------- REMOVE ---------------------------------------------------------------------
  static void removePreference(String key) async {
    // final SharedPreferences prefs = await _init();
    _preferences!.remove(key);
  }
}
