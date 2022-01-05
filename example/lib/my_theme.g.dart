// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// ExtendedThemeGenerator
// **************************************************************************

class MyTheme extends StatelessWidget {
  final MyThemeData light;
  final MyThemeData? dark;
  final Widget child;
  const MyTheme({
    required this.light,
    this.dark,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final currentData = brightness == Brightness.light ? light : dark ?? light;
    return $MyTheme(
      data: currentData,
      child: Theme(
        data: currentData.themeData,
        child: child,
      ),
    );
  }

  static MyThemeData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<$MyTheme>()!.data;
  static Widget Function(BuildContext, Widget?) builder({
    required MyThemeData light,
    MyThemeData? dark,
  }) =>
      (context, child) => MyTheme(
            light: light,
            dark: dark,
            child: child ?? ErrorWidget('Child required'),
          );
}

class MyThemeData {
  final ThemeData themeData;
  MyThemeData({ThemeData? themeData}) : themeData = themeData ?? ThemeData();
}

class $MyTheme extends InheritedWidget {
  final MyThemeData data;
  const $MyTheme({required this.data, required Widget child, Key? key})
      : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget != this;
}

// **************************************************************************
// ExtendedThemeDataGenerator
// **************************************************************************

class PlayerColorsData {
  final Color player1;
  final Color player2;
  const PlayerColorsData({
    required this.player1,
    required this.player2,
  });
}

class MessageColorsData {
  final Color? warning;
  final Color? success;
  final Color? danger;
  const MessageColorsData({
    this.warning,
    this.success,
    this.danger,
  });
}
