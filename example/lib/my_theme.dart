// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

// You have to put this here... manually, ugh right?
// But it will allow the generator to create a part file.
part 'my_theme.g.dart';

// Here we define our Theme's custom properties.
// Be aware that all your 'definitions' are private classes (prefixed with '_').
@ExtendedTheme()
class _MyTheme {
  // You can use normal classes, but using @ExtendedThemeData will give you more benefits!
  _CustomWidget customWidget = _CustomWidget();
  _Spaces spaces = _Spaces();
}

@ExtendedThemeData()
class _CustomWidget {
  double width = 200;
  double height = 200;
  BoxShape shape = BoxShape.circle;
  Color? backgroundColor;
}

@ExtendedThemeData()
class _Spaces {
  double small = 4.0;
  double medium = 8.0;
  double large = 16.0;
}
