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

This package contains the annotation `ExtendTheme` which you can use to generate a custom theme for your app containing custom properties as well as the default `ThemeData`.

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

Create the class which will hold your custom properties and annotate it with `@ExtendTheme()`.
Also don't forget to add the `part` section, or else the generator can't generate the theme.

```dart
part my_theme.g.dart;

@ExtendTheme()
class MyData {
    final Color customColor;

    const MyData({required this.customColor});
}
```

### Step 2: Generate the ext theme classes

Run `build_runner` to generate your custom theme.
```
flutter pub run build_runner build
```

### Step 3: Configure your themes

Use your newly generated theme classes to define your themes.

```dart
final myLightTheme = ExtThemeData(
    data: ThemeData.light(),
    extData: MyData(customColor: Colors.orange),
);

final myDarkTheme = ExtThemeData(
    data: ThemeData.dark(),
    extData: MyData(customColor: Colors.red),
);
```

### Step 4: Add to MaterialApp

To be able to access our new theme, we need to add it to the MaterialApp. We will use the conveniently generated `.builder` function.

```dart
return MaterialApp(
    builder: ExtTheme.builder(
    	light: myLightTheme,
    	dark: myDarkTheme,
    ),
);
```

### Step 5: Use your theme

```dart
// grab the current active theme from context.
final myTheme = ExtTheme.of(context);
// access ThemeData properties.
final scaffoldColor = myTheme.data.scaffoldBackgroundColor;
 // access custom properties. 
final customColor = myTheme.extData.customColor;
```

### Optional: Use custom names

You can choose to define your own names for the classes that this package will generate by overriding them in the `@ExtendTheme()` annotation.

This way you can make the generated theme feel more app specific.

__widgetName__

Setting `widgetName` tells the generator which name to use for the `Widget` that you add to the _widget tree_ and use to get the `ExtThemeData` from context.
```dart
@ExtendTheme(widgetName: 'MyTheme')

ExtTheme.of(context); // before
MyTheme.of(context); // after
```

__dataClassName__

Setting `dataClassName` tells the generator which name to use instead of `ExtThemeData`. This is the class you use to define your themes.
```dart
@ExtendTheme(dataClassName: 'MyThemeData')

final mylightTheme = ExtThemeData(...); // before
final mylightTheme = MyThemeData(...); // after
```

__extDataFieldName__

Setting `extDataFieldName` tells the generator which name to use for getting your custom data from `ExtThemeData`.
```dart
@ExtendTheme(extDataFieldName: 'custom')

ExtTheme.of(context).extData.customColor; // before
ExtTheme.of(context).custom.customColor; // after
```

__dataFieldName__

Setting `dataFieldName` tells the generator which name to use for getting the original data from `ExtThemeData`.
```dart
@ExtendTheme(dataFieldName: 'd')

ExtTheme.of(context).data.scaffoldBackgroundColor; // before
ExtTheme.of(context).d.scaffoldBackgroundColor; // after
```


## Additional information

This package is based on a solution I proposed in this [article](https://medium.com/@seg.veenstra/extending-the-flutter-theme-48799ebe6c5d) for which you have to create several classes/widgets yourself. This package will do all of that for you.
