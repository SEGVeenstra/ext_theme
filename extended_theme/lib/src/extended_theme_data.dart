import 'package:flutter/material.dart';

abstract class ExtendedThemeData {
  final ThemeData themeData;
  ExtendedThemeData({ThemeData? themeData})
      : themeData = themeData ?? ThemeData();
}
