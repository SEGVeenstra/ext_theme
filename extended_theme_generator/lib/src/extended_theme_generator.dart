import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:extended_theme/extended_theme.dart';
import 'package:source_gen/source_gen.dart';

class ExtendedThemeGenerator extends GeneratorForAnnotation<ExtendedTheme> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return _generateTheme(element, annotation);
  }

  String _generateTheme(Element element, ConstantReader annotaton) {
    final visitor = _ThemeVisitor();
    element.visitChildren(visitor);

    final dataClassName = visitor.dartType.getDisplayString(withNullability: false);

    if (dataClassName.startsWith('_')) {
      throw 'Cannot be private!';
    }
    if (!dataClassName.endsWith('Data')) {
      throw 'End with ' 'Data\', like CustomThemeData';
    }

    final themeWidgetName = dataClassName.substring(0, dataClassName.length - 4);

    final inheritedWidgetName = 'Inherited$themeWidgetName';

    final themeBuilder = StringBuffer();

    //## THEME ##//
    themeBuilder.writeln('class $themeWidgetName extends StatelessWidget {');
    // fields
    themeBuilder.writeln('final $dataClassName light;');
    themeBuilder.writeln('final $dataClassName? dark;');
    themeBuilder.writeln('final Widget child;');
    // constructor
    themeBuilder.writeln('''const $themeWidgetName({
      required this.light,
      this.dark,
      required this.child,
      Key? key,
    }) : super(key: key);''');

    themeBuilder.writeln('''
      @override
      Widget build(BuildContext context) {
        final brightness = MediaQuery.of(context).platformBrightness;
        final currentData = brightness == Brightness.light ? light : dark ?? light;
        return $inheritedWidgetName(
          data: currentData,
          child: Theme(
            data: currentData.themeData,
            child: child,
          ),
        );
      }
    ''');

    // Convenient method
    themeBuilder.writeln(
        'static $dataClassName of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<$inheritedWidgetName>()!.data;');

    // Builder method
    themeBuilder.writeln('''
      static Widget Function(BuildContext, Widget?) builder({
        required $dataClassName light,
        $dataClassName? dark,
      }) =>
        (context, child) => $themeWidgetName(
              light: light,
              dark: dark,
              child: child ?? ErrorWidget('Child required'),
            );
    ''');

    themeBuilder.writeln('}'); // close theme class

    //## INHERITED WIDGET ##///
    themeBuilder.writeln('class $inheritedWidgetName extends InheritedWidget {');

    // Fields
    themeBuilder.writeln('final $dataClassName data;');

    // Constructor
    themeBuilder.writeln('''
      const $inheritedWidgetName({required this.data, required Widget child, Key? key})
      : super(
          key: key,
          child: child,
        );
    ''');

    // Functions
    themeBuilder.writeln('''
      @override
      bool updateShouldNotify(covariant InheritedWidget oldWidget) => oldWidget != this;    
    ''');

    themeBuilder.writeln('}');

    return themeBuilder.toString();
  }
}

class _ThemeVisitor extends SimpleElementVisitor {
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
