import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendedTheme()
abstract class _MyTheme {
  _PlayerColors get playerColors;
}

abstract class _PlayerColors {
  Color get player1;
  Color get player2;
}
