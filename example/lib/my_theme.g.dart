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
  final PlayerColorsData playerColors;
  final MessageColorsData? messageColors;
  final Color? gameBackgroundColor;
  MyThemeData({
    ThemeData? themeData,
    required this.playerColors,
    this.messageColors,
    this.gameBackgroundColor,
  }) : themeData = themeData ?? ThemeData();
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
  final _defaults = _PlayerColorsData();
  late final Color? player1;
  late final Color? player2;
  PlayerColorsData({
    Color? player1,
    Color? player2,
  }) {
    this.player1 = player1 ?? _defaults.player1;
    this.player2 = player2 ?? _defaults.player2;
  }
}

class MessageColorsData {
  final _defaults = _MessageColorsData();
  late final Color warning;
  late final Color? success;
  late final Color? danger;
  MessageColorsData({
    Color? warning,
    Color? success,
    Color? danger,
  }) {
    this.warning = warning ?? _defaults.warning;
    this.success = success ?? _defaults.success;
    this.danger = danger ?? _defaults.danger;
  }
}
