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

A simple, yet powerfull way to extend theming in `flutter`.
This package contains the annotation for `exteneded_theme_generator`.

## Features

This package contains the annotation `ExtendTheme` which you can use to generate a custom theme for your app containing custom properties as well as the default `ThemeData`.

## Getting started

Start by adding this package as a normal dependency.
```yaml
extended_theme: any
```
and add `extended_theme_generator` as a `dev_dependency`.
```yaml
exteneded_theme_generator: any
```

## Usage

Your custom theme will be up and running in no time, just follow these easy steps:

### Step 1: Create your custom theme data

Create a file for your custom theme(data).
For example: `my_theme.dart`.

Create the class which will hold your custom properties and annotate it with `@ExtendTheme`.
Also don't forget to add the `part` section, or else the generator can't generate the theme.

```dart
part my_theme.g.dart;

@ExtendTheme
class MyData {
    final Color customColor;

    const MyData({required this.customColor});
}
```

### Step 2: generate the theme

Run `build_runner` to generate your custom theme.
```
flutter pub run build_runner build
```

### Step 3: create your themes

Use your newly generated theme classes to define your themes.

```dart
final myLightTheme = ExtenededThemeData(
    data: ThemeData.light(),
    extendedData: MyData(customColor: Colors.orange),
);

final mydarkTheme = ExtenededThemeData(
    data: ThemeData.dark(),
    extendedData: MyData(customColor: Colors.red),
);
```

### Step 4: Add to MaterialApp

To be able to access our new theme, we need to add it to the MaterialApp.

```dart
return MaterialApp(
	builder: ExtendedTheme.builder(
    	light: myLightTheme,
    	dark: myDarkTheme,
    ),
    ...
);
```

### Step 5: Use your theme

```dart
final myTheme = ExtendedTheme.of(context);
// access ThemeData properties.
final scaffoldColor = myTheme.data.scaffoldBackgroundColor;
 // access custom properties. 
final customColor = myTheme.extendedData.customColor;
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
