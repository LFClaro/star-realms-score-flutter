import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Realms Scoring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Star Scoring'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _userCounter = 50;
  int _opponentCounter = 50;

  static const bodyText = TextStyle(
    fontFamily: 'YuseiMagic',
    fontSize: 30.0,
  );

  static const buttonText = TextStyle(
    fontFamily: 'YuseiMagic',
    fontSize: 25.0,
    color: Colors.white,
  );

  static const userScoreText = TextStyle(
    fontFamily: 'Sixtyfour',
    fontSize: 50.0,
    color: Colors.blue,
  );

  static const opponentScoreText = TextStyle(
    fontFamily: 'Sixtyfour',
    fontSize: 50.0,
    color: Colors.greenAccent,
  );

  static const userBoxShadow = [
    BoxShadow(
      blurRadius: 40.0,
      offset: Offset(3.0, 6.0),
      blurStyle: BlurStyle.inner,
    )
  ];

  static const opponentBoxShadow = [
    BoxShadow(
      blurRadius: 40.0,
      offset: Offset(-3.0, -6.0),
      blurStyle: BlurStyle.inner,
    )
  ];

  final buttonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size(80, 60),
    backgroundColor: Colors.white30,
  );

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
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/space.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
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
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: opponentBoxShadow,
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Your score',
                            style: bodyText,
                          ),
                          Text(
                            '$_opponentCounter',
                            style: opponentScoreText,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: [
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _decrementOpponentCounter(10);
                            },
                            child: const Text(
                              "-10",
                              style: buttonText,
                            ),
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _decrementOpponentCounter(5);
                            },
                            child: const Text(
                              "-5",
                              style: buttonText,
                            ),
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _decrementOpponentCounter(1);
                            },
                            child: const Text(
                              "-1",
                              style: buttonText,
                            ),
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _incrementOpponentCounter(1);
                            },
                            child: const Text(
                              "+1",
                              style: buttonText,
                            ),
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _incrementOpponentCounter(5);
                            },
                            child: const Text(
                              "+5",
                              style: buttonText,
                            ),
                          ),
                          TextButton(
                            style: buttonStyle,
                            onPressed: () {
                              _incrementOpponentCounter(10);
                            },
                            child: const Text(
                              "+10",
                              style: buttonText,
                            ),
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
                  onPressed: _resetCounters, icon: const Icon(Icons.refresh)),
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
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: userBoxShadow,
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Your score',
                          style: bodyText,
                        ),
                        Text(
                          '$_userCounter',
                          style: userScoreText,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: 10.0,
                      runSpacing: 20.0,
                      children: [
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _decrementUserCounter(10);
                          },
                          child: const Text(
                            "-10",
                            style: buttonText,
                          ),
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _decrementUserCounter(5);
                          },
                          child: const Text(
                            "-5",
                            style: buttonText,
                          ),
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _decrementUserCounter(1);
                          },
                          child: const Text(
                            "-1",
                            style: buttonText,
                          ),
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _incrementUserCounter(1);
                          },
                          child: const Text(
                            "+1",
                            style: buttonText,
                          ),
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _incrementUserCounter(5);
                          },
                          child: const Text(
                            "+5",
                            style: buttonText,
                          ),
                        ),
                        TextButton(
                          style: buttonStyle,
                          onPressed: () {
                            _incrementUserCounter(10);
                          },
                          child: const Text(
                            "+10",
                            style: buttonText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
