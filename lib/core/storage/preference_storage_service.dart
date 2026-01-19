

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Shared Preference Keys
class PreferenceStorageKeys {
  static const String loggedIn = 'loggedIn';
  static const String theme = 'theme';

}

/// [PreferenceStorageService] - To persist shared preference data locally
/// in the form of key value pairs
///
/// In iOS, It uses `UserDefaults`
///
/// In Android, It uses `SharedPreference`
class PreferenceStorageService {
  static PreferenceStorageService? _instance;
  static SharedPreferences? _preferences;

  int? get theme => _getFromDisk(PreferenceStorageKeys.theme) ?? 2;



  bool get loggedIn => _getFromDisk(PreferenceStorageKeys.loggedIn) ?? false;



  void get logout{
    _preferences?.clear();
  }
  set theme(int? value) => _saveToDisk(PreferenceStorageKeys.theme, value);


  set loggedIn(bool value) =>
      _saveToDisk(PreferenceStorageKeys.loggedIn, value);










  static Future<PreferenceStorageService?> getInstance() async {
    _instance ??= PreferenceStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  dynamic _getFromDisk(String key, {bool needLog = false}) {
    final value = _preferences!.get(key);
    if (needLog) {
      debugPrint('Key: $key');
    }
    return value;
  }

  void _saveToDisk<T>(String key, T content, {bool needLog = false}) {
    if (needLog) {
      debugPrint('Store - Key: $key and Value: $content');
    }
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }


}
