library extended_theme_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/extended_theme_data_generator.dart';
import 'src/extended_theme_generator.dart';

Builder extendedThemeBuilder(BuilderOptions options) => SharedPartBuilder([ExtendedThemeGenerator()], 'theme');
Builder extendedThemeDataBuilder(BuilderOptions options) =>
    SharedPartBuilder([ExtendedThemeDataGenerator()], 'theme_data');
