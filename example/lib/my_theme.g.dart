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
  final CustomWidgetData customWidget;
  final SpacesData spaces;
  MyThemeData({
    ThemeData? themeData,
    required this.customWidget,
    required this.spaces,
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

class CustomWidgetData {
  final _defaults = _CustomWidget();
  late final double width;
  late final double height;
  late final BoxShape shape;
  late final Color? backgroundColor;
  CustomWidgetData({
    double? width,
    double? height,
    BoxShape? shape,
    Color? backgroundColor,
  }) {
    this.width = width ?? _defaults.width;
    this.height = height ?? _defaults.height;
    this.shape = shape ?? _defaults.shape;
    this.backgroundColor = backgroundColor ?? _defaults.backgroundColor;
  }
}

class SpacesData {
  final _defaults = _Spaces();
  late final double small;
  late final double medium;
  late final double large;
  SpacesData({
    double? small,
    double? medium,
    double? large,
  }) {
    this.small = small ?? _defaults.small;
    this.medium = medium ?? _defaults.medium;
    this.large = large ?? _defaults.large;
  }
}
