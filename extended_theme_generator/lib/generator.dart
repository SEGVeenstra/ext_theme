library extended_theme_generator;

import 'package:build/build.dart';
import 'package:extended_theme_generator/src/extended_theme_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder extendedThemeBuilder(BuilderOptions options) => SharedPartBuilder([ExtendedThemeGenerator()], 'theme');
