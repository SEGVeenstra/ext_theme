import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final myTheme = ExtendedThemeData(
  extendedData: MyThemeData(),
  themeData: ThemeData.light(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExtendedTheme Demo',
      builder: MyTheme.builder(light: myTheme),
      home: const Scaffold(
        body: Center(
          child: Text('test'),
        ),
      ),
    );
  }
}
