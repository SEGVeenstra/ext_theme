import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExtendedTheme Demo',
      builder: MyTheme.builder(
        light: MyThemeData(
          themeData: ThemeData.light(),
          playerColors: const PlayerColorsData(
            player1: Colors.blue,
            player2: Colors.red,
          ),
        ),
        dark: MyThemeData(
          themeData: ThemeData.dark(),
          playerColors: PlayerColorsData(
            player1: Colors.blue.shade800,
            player2: Colors.red.shade800,
          ),
        ),
      ),
      home: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: MyTheme.of(context).playerColors.player1,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: MyTheme.of(context).playerColors.player2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
