class ExtTheme {
  static const dataClassNameField = 'dataClassName';
  static const extDataFieldNameField = 'extDataFieldName';
  static const dataFieldNameField = 'dataFieldName';
  static const widgetNameField = 'widgetName';

  final String dataClassName;
  final String extDataFieldName;
  final String dataFieldName;
  final String widgetName;

  const ExtTheme({
    this.dataClassName = 'ExtThemeData',
    this.dataFieldName = 'data',
    this.extDataFieldName = 'extData',
    this.widgetName = 'ExtTheme',
  });
}
