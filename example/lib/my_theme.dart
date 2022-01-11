// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendedTheme()
class MyThemeData {
  final Color customColor;

  const MyThemeData({required this.customColor});
}
