// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// ExtendedThemeGenerator
// **************************************************************************

class MyAppTheme extends StatelessWidget {
  final ExtendedThemeData light;
  final ExtendedThemeData? dark;
  final Widget child;
  const MyAppTheme({
    required this.light,
    this.dark,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final currentData = brightness == Brightness.light ? light : dark ?? light;
    return _MyAppTheme(
      data: currentData,
      child: Theme(
        data: currentData.data,
        child: child,
      ),
    );
  }

  static ExtendedThemeData of(BuildContext context) {
    final themeData = Theme.of(context);
    return context.dependOnInheritedWidgetOfExactType<_MyAppTheme>()!.data
      ..data = themeData;
  }

  static Widget Function(BuildContext, Widget?) builder({
    required ExtendedThemeData light,
    ExtendedThemeData? dark,
  }) =>
      (context, child) => MyAppTheme(
            light: light,
            dark: dark,
            child: child ?? ErrorWidget('Child required'),
          );
}

class _MyAppTheme extends InheritedWidget {
  final ExtendedThemeData data;
  const _MyAppTheme({required this.data, required Widget child, Key? key})
      : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget != this;
}

class ExtendedThemeData {
  late ThemeData data;
  final AppData appData;
  ExtendedThemeData({
    ThemeData? data,
    required this.appData,
  }) : data = data ?? ThemeData();
}
