import 'package:ext_theme/ext_theme.dart';
import 'package:flutter/material.dart';

/// This `part` is required! (uncommented)
// part 'ext_theme_example.g.dart';

/// Create a class with the properties you want in your theme and
/// annotate it with `@ExtTheme()`.
///
/// This can add any property you want so you can also create
/// style-objects for your custom widgets.
@ExtTheme(
  widgetName: 'MyTheme', // optional, defaults to 'ExtTheme'.
  dataClassName: 'MyThemeData', // optional, defaults to 'ExtThemeData'.
  dataFieldName: 'data', // optional, defaults to 'data'
  extDataFieldName: 'myData', // optional, defaults to 'extData'.
)
class MyData {
  final Color myCustomColor;
  final CustomWidgetData customWidget;

  MyData({
    required this.myCustomColor,
    required this.customWidget,
  });
}

class CustomWidgetData {
  final Color backgroundColor;
  final int width;
  final int height;

  CustomWidgetData({
    required this.backgroundColor,
    required this.width,
    required this.height,
  });
}
