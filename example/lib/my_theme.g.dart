// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// ExtThemeGenerator
// **************************************************************************

class MyAppTheme extends StatelessWidget {
  final MyAppThemeData light;
  final MyAppThemeData? dark;
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

  static MyAppThemeData of(BuildContext context) {
    final themeData = Theme.of(context);
    return context
        .dependOnInheritedWidgetOfExactType<_MyAppTheme>()!
        .data
        .copyWith(data: themeData);
  }

  static Widget Function(BuildContext, Widget?) builder({
    required MyAppThemeData light,
    MyAppThemeData? dark,
  }) =>
      (context, child) => MyAppTheme(
            light: light,
            dark: dark,
            child: child ?? ErrorWidget('Child required'),
          );
}

class _MyAppTheme extends InheritedWidget {
  final MyAppThemeData data;
  const _MyAppTheme({required this.data, required Widget child, Key? key})
      : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget != this;
}

class MyAppThemeData {
  final ThemeData data;
  final AppData appData;
  MyAppThemeData({
    ThemeData? data,
    required this.appData,
  }) : data = data ?? ThemeData();

  MyAppThemeData copyWith({
    ThemeData? data,
    AppData? appData,
  }) =>
      MyAppThemeData(
        appData: appData ?? this.appData,
        data: data ?? this.data,
      );
}
