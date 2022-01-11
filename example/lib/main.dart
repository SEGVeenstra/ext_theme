import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final myTheme = ExtendedThemeData(
  extendedData: const CustomData(
    customColor: Colors.orange,
  ),
  data: ThemeData.light(),
);

final myDarkTheme = ExtendedThemeData(
  extendedData: const CustomData(
    customColor: Colors.pink,
  ),
  data: ThemeData.dark(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExtendedTheme Demo',
      builder: ExtendedTheme.builder(
        light: myTheme,
        dark: myDarkTheme,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extendedTheme = ExtendedTheme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: extendedTheme.extendedData.customColor,
          child: Text(
            'basic ThemeData usage',
            style: extendedTheme.data.textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
