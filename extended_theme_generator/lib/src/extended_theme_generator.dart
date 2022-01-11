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

    final dataClassName = visitor.dartType.getDisplayString(withNullability: true);
    final statelessWidgetName = annotaton.read(ExtendedTheme.widgetNameField).stringValue;
    final inheritedWidgetName = '_$statelessWidgetName';
    final extendedThemeClassName = annotaton.read(ExtendedTheme.dataClassNameField).stringValue;
    final extendedDataFieldName = annotaton.read(ExtendedTheme.extendedDataFieldNameField).stringValue;
    final themeDataFieldName = annotaton.read(ExtendedTheme.dataFieldNameField).stringValue;

    final themeBuilder = StringBuffer();

    //## THEME ##//
    themeBuilder.writeln('class $statelessWidgetName extends StatelessWidget {');
    // fields
    themeBuilder.writeln('final $extendedThemeClassName light;');
    themeBuilder.writeln('final $extendedThemeClassName? dark;');
    themeBuilder.writeln('final Widget child;');
    // constructor
    themeBuilder.writeln('''const $statelessWidgetName({
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
            data: currentData.$themeDataFieldName,
            child: child,
          ),
        );
      }
    ''');

    // Convenient method
    themeBuilder.writeln('''
      static $extendedThemeClassName of(BuildContext context) {
          final themeData = Theme.of(context);
          return context.dependOnInheritedWidgetOfExactType<$inheritedWidgetName>()!.data..$themeDataFieldName = themeData;
        }
    ''');

    // Builder method
    themeBuilder.writeln('''
      static Widget Function(BuildContext, Widget?) builder({
        required $extendedThemeClassName light,
        $extendedThemeClassName? dark,
      }) =>
        (context, child) => $statelessWidgetName(
              light: light,
              dark: dark,
              child: child ?? ErrorWidget('Child required'),
            );
    ''');

    themeBuilder.writeln('}'); // close theme class

    //## INHERITED WIDGET ##///
    themeBuilder.writeln('class $inheritedWidgetName extends InheritedWidget {');

    // Fields
    themeBuilder.writeln('final $extendedThemeClassName data;');

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

    //## DATACLASS WRAPPER
    themeBuilder.writeln('class $extendedThemeClassName {');

    themeBuilder.writeln('late ThemeData $themeDataFieldName;');
    themeBuilder.writeln('final $dataClassName $extendedDataFieldName;');

    themeBuilder.writeln('''
      $extendedThemeClassName({
        ThemeData? $themeDataFieldName,
        required this.$extendedDataFieldName,
      }) : $themeDataFieldName = $themeDataFieldName ?? ThemeData();
    ''');

    themeBuilder.writeln('}'); // close ExtendedTheme

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
