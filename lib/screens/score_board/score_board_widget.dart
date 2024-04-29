import 'package:flutter/material.dart';

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

  _incrementUserCounter(int incrementBy) {
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

  _decrementUserCounter(int decrementBy) {
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

  _incrementOpponentCounter(int incrementBy) {
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

  _decrementOpponentCounter(int decrementBy) {
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

  _resetCounters() {
    setState(() {
      _userCounter = 50;
      _opponentCounter = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle = TextStyle(
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
      style: bodyTextStyle,
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
              child: SingleChildScrollView(
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                const SizedBox(height: 10),
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
                    const Divider(
                      height: 36.0,
                      thickness: 2.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Colors.white30,
                    ),
                    IconButton.filled(
                        onPressed: _resetCounters,
                        icon: const Icon(
                          Icons.refresh,
                          size: 50.0,
                        )),
                    const Divider(
                      height: 36.0,
                      thickness: 2.0,
                      indent: 32.0,
                      endIndent: 32.0,
                      color: Colors.white30,
                    ),
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
                              const SizedBox(height: 10),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
