// ignore_for_file: unused_element

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendedTheme()
abstract class _MyTheme {
  _PlayerColorsData get playerColors;
}

@ExtendedThemeData()
abstract class _PlayerColorsData {
  Color get player1;
  Color get player2;
}

@ExtendedThemeData()
abstract class _MessageColorsData {
  Color get warning;
  Color get success;
  Color get danger;
}