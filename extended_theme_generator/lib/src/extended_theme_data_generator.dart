import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:source_gen/source_gen.dart';

class ExtendedThemeDataGenerator extends GeneratorForAnnotation<ExtendedThemeData> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return _generateThemeData(element, annotation);
  }

  String _generateThemeData(Element element, ConstantReader annotation) {
    final visitor = ExtendedThemeDataVisitor();
    element.visitChildren(visitor);

    final dataBuffer = StringBuffer();

    dataBuffer.writeln('// ${visitor.className}');

    return dataBuffer.toString();
  }
}

class ExtendedThemeDataVisitor extends SimpleElementVisitor {
  late final DartType className;

  @override
  visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType;
  }
}
