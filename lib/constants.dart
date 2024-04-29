import 'package:flutter/material.dart';

abstract class Constants {
  static const kBodyText = TextStyle(
    fontFamily: 'YuseiMagic',
    fontSize: 30.0,
  );

  static const kButtonText = TextStyle(
    fontFamily: 'YuseiMagic',
    fontSize: 25.0,
    color: Colors.white,
  );

  static const kUserScoreText = TextStyle(
    fontFamily: 'Sixtyfour',
    fontSize: 50.0,
    color: Colors.blue,
  );

  static const kOpponentScoreText = TextStyle(
    fontFamily: 'Sixtyfour',
    fontSize: 50.0,
    color: Colors.greenAccent,
  );

  static const kUserBoxShadow = [
    BoxShadow(
      blurRadius: 40.0,
      offset: Offset(3.0, 6.0),
      blurStyle: BlurStyle.inner,
    )
  ];

  static const kOpponentBoxShadow = [
    BoxShadow(
      blurRadius: 40.0,
      offset: Offset(-3.0, -6.0),
      blurStyle: BlurStyle.inner,
    )
  ];

  static const bool isStripeLive = false;
  static const double taxRate = 0.13;
  static const String currencyCode = 'cad';
  static const int zegoAppID = 1642287470;
  static const String zegoAppSign =
      'b80ef8afb3ea36ed69388f3280ed69d2c73504df6fc8cce67baa010cfe7519c6';
}
