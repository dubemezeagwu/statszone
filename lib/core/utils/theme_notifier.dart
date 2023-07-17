import 'package:statszone/core/app_core.dart';

  final themeNotifierProvider =
  StateNotifierProvider<ThemeNotifier,bool>((ref) => ThemeNotifier());

  class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);

  void toggleTheme (){
    state = !state;
  }

  loadFromPrefs () async {
    state = await AppPreferences.getThemePreferences();
  }

  saveToPrefs () async {
    AppPreferences.setThemePreferences(state);
  }
  }

