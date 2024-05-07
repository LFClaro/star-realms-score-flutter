import 'package:flutter/material.dart';

import 'package:star_realms_score/screens/scoreboard_screen.dart';

void main() => runApp(const ScoreApp());

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Realms Scoring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: ScoreboardScreen.id,
      routes: {
        ScoreboardScreen.id: (context) => const ScoreboardScreen(),
      },
    );
  }
}
