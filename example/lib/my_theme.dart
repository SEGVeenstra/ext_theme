// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendedTheme()
class _MyTheme {
  _PlayerColorsData playerColors = _PlayerColorsData();
  _MessageColorsData? messageColors;
  Color? gameBackgroundColor;
}

@ExtendedThemeData()
class _PlayerColorsData {
  Color? player1;
  Color? player2;
}

@ExtendedThemeData()
class _MessageColorsData {
  Color warning = Colors.yellow; // TODO: default values are currently not supported.
  Color? success;
  Color? danger = Colors.red;
}
