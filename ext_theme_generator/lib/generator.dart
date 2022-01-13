library extended_theme_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/ext_theme_generator.dart';

Builder extThemeBuilder(BuilderOptions options) => SharedPartBuilder(
      [ExtThemeGenerator()],
      'theme',
    );
