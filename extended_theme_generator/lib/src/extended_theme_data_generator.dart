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

    final newClassName = visitor.dartType.className.endWithData;
    final originalClassName = visitor.dartType.getDisplayString(withNullability: true);

    final dataBuffer = StringBuffer();

    dataBuffer.writeln('class $newClassName {');

    dataBuffer.writeln('final _defaults = $originalClassName();');

    visitor.fields.forEach((key, value) {
      final typeName = value.getDisplayString(withNullability: true).withoutLeadingUnderscore;
      dataBuffer.writeln('late final $typeName $key;');
    });

    dataBuffer.writeln('$newClassName({');
    visitor.fields.forEach((key, value) {
      final nullableType = '${value.getDisplayString(withNullability: false)}?';
      dataBuffer.writeln('$nullableType $key,');
    });
    dataBuffer.writeln('}){');
    visitor.fields.forEach((key, value) {
      //if (value.nullabilitySuffix == NullabilitySuffix.question) {
      dataBuffer.writeln('this.$key = $key ?? _defaults.$key;');
      //}
    });
    dataBuffer.writeln('}');
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
