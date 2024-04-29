import 'package:flutter/material.dart';

import 'constants.dart';

class PointsButton extends StatefulWidget {
  const PointsButton({
    super.key,
    required this.points,
    required this.onPressed,
    this.icon,
  });

  final int points;
  final Function() onPressed;
  final IconData? icon;

  @override
  State<PointsButton> createState() => PointsButtonState();
}

class PointsButtonState extends State<PointsButton> {
  final buttonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(100, 60),
    backgroundColor: Colors.white54,
  );
  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      widget.points.toString(),
      style: Constants.kButtonText,
    );

    return ElevatedButton.icon(
      icon: widget.icon != null
          ? Icon(
              widget.icon,
              color: Colors.white,
              size: 25.0,
            )
          : const Icon(
              Icons.add,
              color: Colors.white,
              size: 25.0,
            ),
      style: buttonStyle,
      onPressed: widget.onPressed,
      label: textWidget,
    );
  }
}
