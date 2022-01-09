// ignore_for_file: unused_element, unused_field

import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

// You have to put this here... manually, ugh right?
// But it will allow the generator to create a part file.
part 'my_theme.g.dart';

// Here we define our Theme's custom properties.
// Be aware that all your 'definitions' are private classes (prefixed with '_').
@ExtendedTheme()
class MyThemeData {}
