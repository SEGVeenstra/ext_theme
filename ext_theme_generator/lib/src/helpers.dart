import 'package:analyzer/dart/element/type.dart';

extension StringHelper on String {
  bool get hasLeadingUnderscore => startsWith('_');
  String get withoutLeadingUnderscore => startsWith('_') ? substring(1) : this;
  String get endWithData => endsWith('Data') ? this : '${this}Data';
  String get endWithQuestionMark => endsWith('?') ? this : '${this}?';
}

extension DartTypeHelper on DartType {
  String get className {
    final className = getDisplayString(withNullability: true);
    if (className.startsWith('_')) {
      throw 'Your definition classes should not be private (start with \'_\')';
    }
    return className;
  }
}
