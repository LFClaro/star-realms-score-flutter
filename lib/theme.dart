// ignore_for_file: overridden_fields, annotate_overrides
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
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

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => CustomTypography(this);
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

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

// We'll create a custom typography class for the theme.
class CustomTypography extends Typography {
  CustomTypography(this.theme);

  final StarScoreTheme theme;

  String get displayLargeFamily => 'Sixtyfour';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Sixtyfour',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Sixtyfour';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Sixtyfour',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Sixtyfour';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Sixtyfour',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Yusei Magic';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineMediumFamily => 'Yusei Magic';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Yusei Magic';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Yusei Magic';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Yusei Magic';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Yusei Magic',
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Yusei Magic';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Yusei Magic',
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Yusei Magic';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.secondaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Yusei Magic';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.secondaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Yusei Magic';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Yusei Magic',
        color: theme.secondaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Roboto';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Roboto';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Roboto';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

// TextStyle Helper
extension TextStyleHelper on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);

  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
