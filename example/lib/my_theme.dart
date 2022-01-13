import 'package:ext_theme/ext_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtTheme(
  widgetName: 'MyAppTheme',
  dataClassName: 'MyAppThemeData',
  extendedDataFieldName: 'appData',
)
class AppData {
  final Color customColor;

  const AppData({required this.customColor});
}
