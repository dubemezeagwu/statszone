import 'package:statszone/core/app_core.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  ThemeNotifier (){
    _darkTheme;
  }

  void toggleTheme (){
    _darkTheme = !darkTheme;
  }

  loadFromPrefs() async {
    _darkTheme = await AppPreferences.getThemePreferences();
    notifyListeners();
  }

  saveToPrefs() async {
    AppPreferences.setThemePreferences(darkTheme);
  }
  }

