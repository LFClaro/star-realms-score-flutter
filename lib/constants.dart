import 'package:flutter/material.dart';

abstract class Constants {
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
}
