import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendTheme(
  widgetName: 'MyAppTheme',
  extendedDataFieldName: 'appData',
)
class AppData {
  final Color customColor;

  const AppData({required this.customColor});
}
