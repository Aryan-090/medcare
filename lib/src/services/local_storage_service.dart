import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  static const String firstTimeKey = "isFirstTime";
  static const String isLoggedInKey = "isLoggedIn";

  /// check first time open
  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(firstTimeKey) ?? true;
  }

  /// mark onboarding completed
  static Future<void> setFirstTimeDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(firstTimeKey, false);
  }

  /// save login status
  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }

  /// check login status
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  /// logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, false);
  }
}