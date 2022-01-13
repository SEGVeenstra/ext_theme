<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Easily extend the theming in `flutter`. Add custom properties and styles for custom widgets in a heartbeat.

This package contains the annotation for `ext_theme_generator`.

## Features

This package contains the annotation `ExtTheme` which you can use to generate a custom theme for your app containing custom properties as well as the default `ThemeData`.

## Getting started

Start by adding this package as a normal dependency.
```yaml
ext_theme: any
```
and add `ext_theme_generator` as a `dev_dependency`.
```yaml
ext_theme_generator: any
```

## Usage

Your custom theme will be up and running in no time, just follow these steps.

### Step 1: Create your custom theme data

Create a file for your custom theme(data).
For example: `my_theme.dart`.

Create the class which will hold your custom properties and annotate it with `@ExtTheme()`.
Also don't forget to add the `part` section, or else the generator can't generate the theme.

```dart
part my_theme.g.dart;

@ExtTheme()
class MyData {
    final Color customColor;

    const MyData({required this.customColor});
}
```

### Step 2: Generate the theme classes

Run `build_runner` to generate your custom theme.
```
flutter pub run build_runner build
```

### Step 3: Configure your themes

Use your newly generated theme classes to define your themes.

```dart
final myLightTheme = ExtendedThemeData(
    data: ThemeData.light(),
    extData: MyData(customColor: Colors.orange),
);

final myDarkTheme = ExtendedThemeData(
    data: ThemeData.dark(),
    extData: MyData(customColor: Colors.red),
);
```

### Step 4: Add to MaterialApp

To be able to access our new theme, we need to add it to the MaterialApp. We will use the conveniently generated `.builder` function.

```dart
return MaterialApp(
    builder: ExtendedTheme.builder(
    	light: myLightTheme,
    	dark: myDarkTheme,
    ),
);
```

### Step 5: Use your theme

```dart
// grab the current active theme from context.
final myTheme = ExtendedTheme.of(context);
// access ThemeData properties.
final scaffoldColor = myTheme.data.scaffoldBackgroundColor;
 // access custom properties. 
final customColor = myTheme.extendedData.customColor;
```

### Optional: Use custom names

You can choose to define your own names for the classes that this package will generate by overriding them in the `@ExtTheme()` annotation.

This way you can make the generated theme feel more app specific.

__widgetName__

Setting `widgetName` tells the generator which name to use for the `Widget` that you add to the _widget tree_ and use to get the `ExtendedThemeData` from context.
```dart
@ExtTheme(widgetName: 'MyTheme')

ExtendedTheme.of(context); // before
MyTheme.of(context); // after
```

__dataClassName__

Setting `dataClassName` tells the generator which name to use instead of `ExtendedThemeData`. This is the class you use to define your themes.
```dart
@ExtTheme(dataClassName: 'MyThemeData')

final mylightTheme = ExtendedThemeData(...); // before
final mylightTheme = MyThemeData(...); // after
```

__extendedDataFieldName__

Setting `extendedDataFieldName` tells the generator which name to use for getting your custom data from `ExtendedThemeData`.
```dart
@ExtTheme(extDataFieldName: 'custom')

ExtendedTheme.of(context).extendedData.customColor; // before
ExtendedTheme.of(context).custom.customColor; // after
```

__dataFieldName__

Setting `dataFieldName` tells the generator which name to use for getting the original data from `ExtendedThemeData`.
```dart
@ExtTheme(dataFieldName: 'd')

ExtendedTheme.of(context).data.scaffoldBackgroundColor; // before
ExtendedTheme.of(context).d.scaffoldBackgroundColor; // after
```


## Additional information

This package is based on a solution I proposed in this [article](https://medium.com/@seg.veenstra/extending-the-flutter-theme-48799ebe6c5d) for which you have to create several classes/widgets yourself. This package will do all of that for you.
