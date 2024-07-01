import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  /// web need to get fresh piece each time
  // SharedPreferences? prefs;

  SpUtil._();

  static final SpUtil _singleton = SpUtil._();

  factory SpUtil() => _singleton;

  Future init() async {
    // prefs = await SharedPreferences.getInstance();
    // return prefs;
  }

  /// put object.
  Future<bool>? putObject(String key, Object value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  /// get obj.
  Future<T?> getObj<T>(String key, T Function(Map v) f, {T? defValue}) async {
    final map = await getObject(key);
    return map == null ? defValue : f(map);
  }

  /// get object.
  Future<Map?> getObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);
    return (data == null || data.isEmpty) ? null : json.decode(data);
  }

  /// get string.
  Future<String?> getString(String key, {String? defValue = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defValue;
  }

  /// put string.
  Future<bool>? putString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  /// get bool.
  Future<bool?> getBool(String key, {bool? defValue = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defValue;
  }

  /// put bool.
  Future<bool>? putBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  /// get string list.
  Future<List<String>?> getStringList(String key,
      {List<String>? defValue = const []}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? defValue;
  }

  /// put string list.
  Future<bool>? putStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, value);
  }

  /// get dynamic.
  dynamic getDynamic(String key, {Object? defValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? defValue;
  }

  /// have key.
  Future<bool?> haveKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().contains(key);
  }

  /// contains Key.
  Future<bool?> containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  /// get keys.
  Future<Set<String>?> getKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  /// remove.
  Future<bool>? remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  /// clear.
  Future<bool>? clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  /// Fetches the latest values from the host platform.
  Future<void>? reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.reload();
  }
}
