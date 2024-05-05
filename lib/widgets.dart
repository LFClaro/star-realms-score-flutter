import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:star_realms_score/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class WebBanner extends StatefulWidget {
  const WebBanner({super.key});

  @override
  State<WebBanner> createState() => _WebBannerState();
}

class _WebBannerState extends State<WebBanner> {
  final Uri _url =
      Uri.parse("https://github.com/LFClaro/star-realms-score-flutter.git");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = TextStyle(
      fontSize: 30.0,
      color: StarScoreTheme.of(context).primaryTextColor,
    );

    final bodyTextStyle = TextStyle(
      fontSize: 16,
      color: StarScoreTheme.of(context).primaryTextColor,
    );

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black54,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
        Image.asset(
          "images/score_icon.png",
          width: 150,
        ),
        Constants.kSizedBox24,
        SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Star Realms Score - Flutter App", style: headerTextStyle),
              Constants.kDivider,
              Text(
                "A Flutter app to keep score on the Star Realms deckbuilding game.\n\nStar Realms is a two-player card game in which the score changes frequently. Each score board is facing one of the players during the game, for easier tracking.\n\nA quick app I built in a day, with the intention of training state management and Flutter project structuring.",
                style: bodyTextStyle,
              ),
              Constants.kSizedBox10,
              ElevatedButton.icon(
                onPressed: _launchUrl,
                icon: const FaIcon(FontAwesomeIcons.github),
                label: const Text('Vist my Github repository!'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
