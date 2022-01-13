import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final myTheme = MyAppThemeData(
  appData: const AppData(
    customColor: Colors.orange,
  ),
  data: ThemeData.light(),
);

final myDarkTheme = MyAppThemeData(
  appData: const AppData(
    customColor: Colors.pink,
  ),
  data: ThemeData.dark(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'extTheme Demo',
      builder: MyAppTheme.builder(
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
    final extTheme = MyAppTheme.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: extTheme.appData.customColor,
          child: Text(
            'basic ThemeData usage',
            style: extTheme.data.textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
