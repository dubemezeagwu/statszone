import 'package:statszone/core/app_core.dart';

class AppPreferences {
  static const themeSettings = "THEME_SETTINGS";

  static void setThemePreferences (bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeSettings,value);
  }

  static Future<bool> getThemePreferences () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeSettings) ?? false;
  }
}