import 'package:flutter/material.dart';

import 'package:star_realms_score/theme.dart';

class PointsButton extends StatefulWidget {
  const PointsButton({
    super.key,
    required this.points,
    required this.onPressed,
  });

  final int points;
  final Function() onPressed;

  @override
  State<PointsButton> createState() => PointsButtonState();
}

class PointsButtonState extends State<PointsButton> {
  @override
  Widget build(BuildContext context) {
    final positiveBtnStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(100, 60),
      backgroundColor: StarScoreTheme.of(context).positiveButton,
    );

    final negativeBtnStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(100, 60),
      backgroundColor: StarScoreTheme.of(context).negativeButton,
    );

    final buttonTextStyle = TextStyle(
      fontFamily: 'YuseiMagic',
      fontSize: 25.0,
      color: StarScoreTheme.of(context).primaryTextColor,
    );
    
    Widget textWidget = Text(
      (widget.points.abs()).toString(),
      style: buttonTextStyle,
    );

    return ElevatedButton.icon(
      icon: widget.points > 0
          ? Icon(
              Icons.add,
              color: StarScoreTheme.of(context).primaryTextColor,
              size: 25.0,
            )
          : Icon(
              Icons.remove,
              color: StarScoreTheme.of(context).primaryTextColor,
              size: 25.0,
            ),
      style: widget.points > 0 ? positiveBtnStyle : negativeBtnStyle,
      onPressed: widget.onPressed,
      label: textWidget,
    );
  }
}
