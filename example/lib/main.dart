import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final myTheme = ExtendedThemeData(
  extendedData: const MyThemeData(
    customColor: Colors.orange,
  ),
  data: ThemeData.light(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExtendedTheme Demo',
      builder: MyTheme.builder(light: myTheme),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extendedTheme = MyTheme.of(context);
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
