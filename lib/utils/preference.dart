import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  Preference();

  Preference._internal();

  Future<void> setValue(String key, var value) async {
    if (value is String) {
      await SharedPreferences.getInstance().then((pref) {
        pref.setString(key, value);
      });
    } else if (value is int) {
      await SharedPreferences.getInstance().then((pref) {
        pref.setInt(key, value);
      });
    } else if (value is bool) {
      await SharedPreferences.getInstance().then((pref) {
        pref.setBool(key, value);
      });
    } else if (value is List<String>) {
      await SharedPreferences.getInstance().then((pref) {
        pref.setStringList(key, value);
      });
    } else if (value is double) {
      await SharedPreferences.getInstance().then((pref) {
        pref.setDouble(key, value);
      });
    }
  }

  Future<String> getStringValue(key) async =>
      await SharedPreferences.getInstance().then((pref) {
        return pref.getString(key) ?? '';
      });

  Future<double> getDoubleValue(key) async =>
      await SharedPreferences.getInstance().then((pref) {
        return pref.getDouble(key) ?? 0.0;
      });

  Future<bool> getBoolValue(key) async =>
      await SharedPreferences.getInstance().then((pref) {
        return pref.getBool(key) ?? false;
      });

  Future<List<String>> getStringListValue(key) async =>
      await SharedPreferences.getInstance().then((pref) {
        return pref.getStringList(key) ?? <String>[];
      });

  Future<int> getIntValue(key) async =>
      await SharedPreferences.getInstance().then((pref) {
        return pref.getInt(key) ?? 0;
      });
}
