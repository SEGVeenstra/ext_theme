// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart' hide ExtendedThemeData;
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

// @ExtendedTheme()
// class MyThemeData extends ExtendedThemeData {
//   MyThemeData({required ThemeData themeData}) : super(themeData: themeData);
// }

@ExtendedTheme()
class MyThemeData {
  MyThemeData({required ThemeData themeData});
}

// This doesn't work when I try to get the one from the extended_theme package.
// No idea why...

// abstract class ExtendedThemeData {
//   final ThemeData themeData;

//   const ExtendedThemeData({required this.themeData});
// }
