import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savana/view/screens/change_player_screen.dart';
import 'package:savana/view/screens/game_screen.dart';
import 'package:savana/view/screens/new_round_screen.dart';
import 'package:savana/view/screens/new_team_screen.dart';
import 'package:savana/view/screens/player_quantity_config_screen.dart';
import 'package:savana/view/screens/start_game_screen.dart';
import 'package:savana/view/screens/write_word_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savana',
      routes: {
        "/": (context) => const PlayerQuantityConfigScreen(),
        "words": (context) => const WriteWordScreen(),
        "change_player": (context) => const ChangePlayerScreen(),
        "start_game": (context) => const StartGameScreen(),
        "new_round": (context) => const NewRoundScreen(),
        "game": (context) => const GameScreen(),
        "new_team": (context) => const NewTeamScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF487400),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 50,
              color: Colors.white,
            ),
            displaySmall: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 32,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 32,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 20,
              color: Colors.white,
            ),
            labelLarge: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 40,
              color: Color(0xFF243110),
            ),
            labelSmall: TextStyle(
              fontFamily: "MouseMemoirs",
              fontSize: 32,
              color: Color(0xFFf09375),
            )),
      ),
    );
  }
}
