import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:star_realms_score/constants.dart';
import 'package:star_realms_score/widgets.dart';
import 'package:star_realms_score/theme.dart';

class ScoreBoardWidget extends StatefulWidget {
  const ScoreBoardWidget({super.key});

  static const String id = '/board';

  @override
  State<ScoreBoardWidget> createState() => _ScoreBoardWidgetState();
}

class _ScoreBoardWidgetState extends State<ScoreBoardWidget> {
  int _userCounter = 50;
  int _opponentCounter = 50;
  double _turns = 0.0;

  final Uri _url =
      Uri.parse("https://github.com/LFClaro/star-realms-score-flutter.git");

  void _incrementUserCounter(int incrementBy) {
    // if _userCounter goes over 99, set it to a maximum of 99
    int result = _userCounter + incrementBy;
    if (result > 99) {
      setState(() {
        _userCounter = 99;
      });
    } else {
      setState(() {
        _userCounter += incrementBy;
      });
    }
  }

  void _decrementUserCounter(int decrementBy) {
    // if _userCounter goes under 0, set it to a minimum of 0
    int result = _userCounter - decrementBy;
    if (result < 0) {
      setState(() {
        _userCounter = 0;
      });
    } else {
      setState(() {
        _userCounter -= decrementBy;
      });
    }
  }

  void _incrementOpponentCounter(int incrementBy) {
    // if _opponentCounter goes over 99, set it to a maximum of 99
    int result = _opponentCounter + incrementBy;
    if (result > 99) {
      setState(() {
        _opponentCounter = 99;
      });
    } else {
      setState(() {
        _opponentCounter += incrementBy;
      });
    }
  }

  void _decrementOpponentCounter(int decrementBy) {
    // if _opponentCounter goes under 0, set it to a minimum of 0
    int result = _opponentCounter - decrementBy;
    if (result < 0) {
      setState(() {
        _opponentCounter = 0;
      });
    } else {
      setState(() {
        _opponentCounter -= decrementBy;
      });
    }
  }

  void _resetCounters() {
    setState(() {
      _userCounter = 50;
      _opponentCounter = 50;
    });
  }

  void _rotateScreen() {
    setState(() => _turns += 0.5);
  }

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

    final scoreTextStyle = TextStyle(
      fontFamily: 'YuseiMagic',
      fontSize: 30.0,
      color: StarScoreTheme.of(context).secondaryTextColor,
    );

    final userScoreText = TextStyle(
      fontFamily: 'Sixtyfour',
      fontSize: 50.0,
      color: StarScoreTheme.of(context).primaryColor,
    );

    final userScoreBoxColor = StarScoreTheme.of(context).secondaryColor;

    final opponentScoreText = TextStyle(
      fontFamily: 'Sixtyfour',
      fontSize: 50.0,
      color: StarScoreTheme.of(context).secondaryColor,
    );

    final opponentScoreBoxColor = StarScoreTheme.of(context).primaryColor;

    Widget scoreText = Text(
      'Your score',
      style: scoreTextStyle,
    );

    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SizedBox(
                width: 800,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (kIsWeb)
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black54,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/score_icon.png",
                                  width: 150,
                                ),
                                Constants.kSizedBoxWidth24,
                                SizedBox(
                                  width: 500,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Star Realms Score - Flutter App",
                                          style: headerTextStyle),
                                      Constants.kDivider,
                                      Text(
                                        "A Flutter app to keep score on the Star Realms deckbuilding game.\n\nStar Realms is a two-player card game in which the score changes frequently. Each score board is facing one of the players during the game, for easier tracking.\n\nA quick app I built in a day, with the intention of training state management and Flutter project structuring.",
                                        style: bodyTextStyle,
                                      ),
                                      Constants.kSizedBox10,
                                      ElevatedButton.icon(
                                        onPressed: _launchUrl,
                                        icon: const FaIcon(FontAwesomeIcons.github),
                                        label: const Text(
                                            'Vist my Github repository!'),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      Constants.kSizedBox30,
                      AnimatedRotation(
                        turns: _turns,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        onEnd: () {
                          _turns = 0.0;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                              quarterTurns: -2,
                              child: Column(
                                children: [
                                  Container(
                                    width: 200.0,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: opponentScoreBoxColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: Constants.kOpponentBoxShadow,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        scoreText,
                                        Text(
                                          '$_opponentCounter',
                                          style: opponentScoreText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          direction: Axis.horizontal,
                                          spacing: 10.0,
                                          runSpacing: 20.0,
                                          children: [
                                            PointsButton(
                                              onPressed: () {
                                                _decrementOpponentCounter(1);
                                              },
                                              points: -1,
                                            ),
                                            PointsButton(
                                              onPressed: () {
                                                _decrementOpponentCounter(5);
                                              },
                                              points: -5,
                                            ),
                                            PointsButton(
                                              onPressed: () {
                                                _decrementOpponentCounter(10);
                                              },
                                              points: -10,
                                            ),
                                          ],
                                        ),
                                        Constants.kSizedBox10,
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          direction: Axis.horizontal,
                                          spacing: 10.0,
                                          runSpacing: 20.0,
                                          children: [
                                            PointsButton(
                                              onPressed: () {
                                                _incrementOpponentCounter(1);
                                              },
                                              points: 1,
                                            ),
                                            PointsButton(
                                              onPressed: () {
                                                _incrementOpponentCounter(5);
                                              },
                                              points: 5,
                                            ),
                                            PointsButton(
                                              onPressed: () {
                                                _incrementOpponentCounter(10);
                                              },
                                              points: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Constants.kDivider,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton.filled(
                                    tooltip: "Reset Counters",
                                    onPressed: _resetCounters,
                                    icon: const Icon(
                                      Icons.restore_rounded,
                                      size: 50.0,
                                    )),
                                Constants.kSizedBoxWidth24,
                                IconButton.filled(
                                    tooltip: "Rotate Screen",
                                    onPressed: _rotateScreen,
                                    icon: const Icon(
                                      Icons.screen_rotation_rounded,
                                      size: 50.0,
                                    )),
                              ],
                            ),
                            Constants.kDivider,
                            Column(
                              children: [
                                Container(
                                  width: 200.0,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: userScoreBoxColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: Constants.kUserBoxShadow,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      scoreText,
                                      Text(
                                        '$_userCounter',
                                        style: userScoreText,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    children: [
                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        direction: Axis.horizontal,
                                        spacing: 10.0,
                                        runSpacing: 20.0,
                                        children: [
                                          PointsButton(
                                            onPressed: () {
                                              _decrementUserCounter(1);
                                            },
                                            points: -1,
                                          ),
                                          PointsButton(
                                            onPressed: () {
                                              _decrementUserCounter(5);
                                            },
                                            points: -5,
                                          ),
                                          PointsButton(
                                            onPressed: () {
                                              _decrementUserCounter(10);
                                            },
                                            points: -10,
                                          )
                                        ],
                                      ),
                                      Constants.kSizedBox10,
                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        direction: Axis.horizontal,
                                        spacing: 10.0,
                                        runSpacing: 20.0,
                                        children: [
                                          PointsButton(
                                            onPressed: () {
                                              _incrementUserCounter(1);
                                            },
                                            points: 1,
                                          ),
                                          PointsButton(
                                            onPressed: () {
                                              _incrementUserCounter(5);
                                            },
                                            points: 5,
                                          ),
                                          PointsButton(
                                            onPressed: () {
                                              _incrementUserCounter(10);
                                            },
                                            points: 10,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Constants.kSizedBox10,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
