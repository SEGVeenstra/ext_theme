import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers.dart';

class ExtendedThemeDataGenerator extends GeneratorForAnnotation<ExtendedThemeData> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return _generateThemeData(element, annotation);
  }

  String _generateThemeData(Element element, ConstantReader annotation) {
    final visitor = ExtendedThemeDataVisitor();
    element.visitChildren(visitor);

    final className = visitor.dartType.className;

    final dataBuffer = StringBuffer();

    dataBuffer.writeln('class $className {');

    visitor.fields.forEach((key, value) {
      final typeName = value.getDisplayString(withNullability: true).withoutLeadingUnderscore;
      dataBuffer.writeln('final $typeName $key;');
    });

    dataBuffer.writeln('const $className({');
    visitor.fields.forEach((key, value) {
      final requiredPrefix = value.toString().endsWith('?') ? '' : 'required';
      dataBuffer.writeln('$requiredPrefix this.$key,');
    });
    dataBuffer.writeln('});');

    dataBuffer.writeln('}');

    return dataBuffer.toString();
  }
}

class ExtendedThemeDataVisitor extends SimpleElementVisitor {
  late final DartType dartType;
  final Map<String, DartType> fields = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    dartType = element.type.returnType;
  }

  @override
  visitFieldElement(FieldElement element) {
    fields[element.name] = element.type;
  }
}
