import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@ExtendedTheme()
class CustomData {
  final Color customColor;

  const CustomData({required this.customColor});
}
