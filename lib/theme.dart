// ignore_for_file: overridden_fields, annotate_overrides
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class StarScoreTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static StarScoreTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color primaryTextColor;
  late Color secondaryTextColor;
  late Color positiveButton;
  late Color negativeButton;
}

class LightModeTheme extends StarScoreTheme {
  late Color primaryColor = const Color(0xFF3A8DC0);
  late Color secondaryColor = const Color(0xFFECC54D);
  late Color primaryTextColor = const Color(0xFFF0F3F1);
  late Color secondaryTextColor = const Color(0xFF333F44);
  late Color positiveButton = const Color(0xFF2E8868);
  late Color negativeButton = const Color(0xFFB04438);
}

class DarkModeTheme extends StarScoreTheme {
  late Color primaryColor = const Color(0xFF2D67a4);
  late Color secondaryColor = const Color(0xFFECC54D);
  late Color positiveButton = const Color(0xFF2E8868);
  late Color negativeButton = const Color(0xFFB04438);
  late Color primaryTextColor = const Color(0xFF333F44);
  late Color secondaryTextColor = const Color(0xFFF0F3F1);
}
