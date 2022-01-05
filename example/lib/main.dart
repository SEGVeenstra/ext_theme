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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: MyTheme.builder(
        light: MyThemeData(),
        dark: MyThemeData(),
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
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: MyTheme.of(context).themeData.primaryColor,
        ),
      ),
    );
  }
}

final myTheme = MyThemeData(
  themeData: ThemeData.light().copyWith(),
  playerColors: PlayerColorsData(
    // Custom property
    player1: Colors.blue,
    player2: Colors.red,
  ),
  messageColors: MessageColorsData(
    // Custom propery
    warning: Colors.yellow,
    error: Colors.red,
    succes: Colors.green,
  ),
);
