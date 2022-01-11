// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// ExtendedThemeGenerator
// **************************************************************************

class ExtendedTheme extends StatelessWidget {
  final ExtendedThemeData light;
  final ExtendedThemeData? dark;
  final Widget child;
  const ExtendedTheme({
    required this.light,
    this.dark,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final currentData = brightness == Brightness.light ? light : dark ?? light;
    return _ExtendedTheme(
      data: currentData,
      child: Theme(
        data: currentData.data,
        child: child,
      ),
    );
  }

  static ExtendedThemeData of(BuildContext context) {
    final themeData = Theme.of(context);
    return context.dependOnInheritedWidgetOfExactType<_ExtendedTheme>()!.data
      ..data = themeData;
  }

  static Widget Function(BuildContext, Widget?) builder({
    required ExtendedThemeData light,
    ExtendedThemeData? dark,
  }) =>
      (context, child) => ExtendedTheme(
            light: light,
            dark: dark,
            child: child ?? ErrorWidget('Child required'),
          );
}

class _ExtendedTheme extends InheritedWidget {
  final ExtendedThemeData data;
  const _ExtendedTheme({required this.data, required Widget child, Key? key})
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
  final CustomData extendedData;
  ExtendedThemeData({
    ThemeData? data,
    required this.extendedData,
  }) : data = data ?? ThemeData();
}
