// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// ExtendedThemeGenerator
// **************************************************************************

class MyTheme extends StatelessWidget {
  final ExtendedThemeData light;
  final ExtendedThemeData? dark;
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
    return _MyTheme(
      data: currentData,
      child: Theme(
        data: currentData.themeData,
        child: child,
      ),
    );
  }

  static ExtendedThemeData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_MyTheme>()!.data;
  static Widget Function(BuildContext, Widget?) builder({
    required ExtendedThemeData light,
    ExtendedThemeData? dark,
  }) =>
      (context, child) => MyTheme(
            light: light,
            dark: dark,
            child: child ?? ErrorWidget('Child required'),
          );
}

class _MyTheme extends InheritedWidget {
  final ExtendedThemeData data;
  const _MyTheme({required this.data, required Widget child, Key? key})
      : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget != this;
}

class ExtendedThemeData {
  late ThemeData themeData;
  final MyThemeData extendedData;
  ExtendedThemeData({
    ThemeData? themeData,
    required this.extendedData,
  }) : themeData = themeData ?? ThemeData();
}
