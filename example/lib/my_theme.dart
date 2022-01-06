// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart';
import 'package:extended_theme_generator/extended_theme.dart';
import 'package:flutter/material.dart';

// You have to put this here... manually, ugh right?
// But it will allow the generator to create a part file.
part 'my_theme.g.dart';

// Here we define our Theme's custom properties.
// Be aware that all your 'definitions' are private classes (prefixed with '_').
@ExtendedTheme()
class MyThemeData extends ExtendedThemeData {
  // You can use normal classes, but using @ExtendedThemeData will give you more benefits!
  final CustomWidgetData customWidget;
  final SpacesData spaces;

  MyThemeData({
    ThemeData? themeData,
    this.customWidget = const CustomWidgetData(),
    this.spaces = const SpacesData(),
  }) : super(themeData: themeData);
}

class CustomWidgetData {
  final double width;
  final double height;
  final BoxShape shape;
  final Color? backgroundColor;

  const CustomWidgetData({
    this.width = 200,
    this.height = 200,
    this.backgroundColor,
    this.shape = BoxShape.circle,
  });
}

class SpacesData {
  final double small;
  final double medium;
  final double large;

  const SpacesData({
    this.small = 4.0,
    this.medium = 8.0,
    this.large = 16.0,
  });
}
