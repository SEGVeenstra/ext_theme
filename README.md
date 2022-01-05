# Extended Theme

This package will allow you to extend __theming__ in Flutter so you can define and use your own properties.

## What does it solve?

Say you want to style custom widgets in your app, but the properties in `ThemeData` don't quite fit your need. You'd rather add your own properties that are more descriptive.
There are several ways to do this.

One way is to create extensions for `Theme`. But they will not be as dynamic unless you start putting logic in them.

Another way is to create your own `Object` that contains your custom styles and provide them to the _widget tree_, just like `Theme` does, with an `InheritedWidget` (or you could use a package like `provider`).

If you have one single style and don't support light _and_ dark theme, this could be fine.

But what happens if you do want to support dark and light themes, and what if your app has two very distinct parts that should use their own `Theme`?

You'll end up with:
- Main Theme light
- Main Theme dark
- Main Custom Theme light (for your custom styling)
- Main Custom Theme dark
- Secondairy Theme light
- Secondairy Theme dark
- Secondairy Custom Theme light
- Secondairy Custom Theme dark

These are 8 themes that you would keep track of so you are using both the right themes (Main and Secondary), but also both the right brightness (light/dark) variants of these themes.

You could end up with 16 different configurations, while only 4 are valid.

And this is exaxtly what __Extended Theme__ solves.
It will take the default `Theme` and _merges_ it with your custom properties into a single custom theme so you can never mix them up.

## How does it work?

__Extended Theme__ relies on code generation to create a whole new custom theme with all the needed utilities based off the definition of your custom properties.

A very basic definition example:
```dart
@ExtendedTheme()
abstract class _MyTheme {
    Color get myCustomColor;
}
```

Now you can run the following command in the terminal:
```bash
flutter pub run build_runner build
```

This will generate the following:
1. A widget called `MyTheme` (based of the definition name) which you can use almost the same as the normal `Theme` widget. In fact, this widget will also add the default `Theme` to the tree so whenever you scope `MyTheme` it will keep your custom properties and the defualt theme in sync.
2. A class called `MyThemeData` which will hold your custom properties as well as the default `ThemeData`.
3. An `InheritedWidget` called `$MyTheme` that allows you to get `MyThemeData` anywhere in the tree.

## How do I use it?

Now that you've got your custom theme you can start using it.

### Defining your themes

You simply define your theme just like you used to do with `ThemeData`.

```dart
final myLightTheme = MyThemeData(
    themeData: ThemeData.light(),
    myCustomColor: Colors.orange,
);

final myDarkTheme = MyThemeData(
    themeData: ThemeData.dark(),
    myCustomColor: Colors.red,
);
```

### Add the Extended Theme to the tree

To have access to your custom properties, we must add `MyTheme` to the tree.

Usually you set `ThemeData` to the `theme` field of `MaterialApp`, this will put it above the `Navigator` and makes sure it's available throughout the app.

We can't just put our `MyThemeData` in the `theme` field, because it's not a `ThemeData` subtype.

To _inject_ `MyTheme` above the `MaterialApp Navigator`, we can use the `builder` field.

You can do it manually:
```dart
return MaterialApp(
    title: 'ExtendedTheme Demo',
    builder: (context, child) => MyTheme(
        light: myLightTheme,
        dark: myDarkTheme,
        child: child,
    ),
    home: const Content(),
);
```
Which might be usefull if you're injecting other widgets, or you can use the conveniently generated builder:
```dart
return MaterialApp(
    title: 'ExtendedTheme Demo',
    builder: MyTheme.builder(
        light: myLightTheme,
        dark: myDarkTheme,
    ),
    home: const Content(),
);
```
If you happen to have multiple distinctive themes in your app, as mentioned in the beginning, you can scope `MyTheme` to a specific section of the app by just adding it in the widget tree whereever you need it:
```dart
return MyTheme(
    light: mySecondaryLightTheme,
    dark: mySecondaryDarkTheme,
    child: SecondaryThemedPage(),
),
```
### Using your custom properties

Accessing your custom properties is as easy as:
```dart
return Container(
    color: MyTheme.of(context).myCustomColor,
);
```

## ExtendedThemeData

In our previous example we only used a simple property.
But what if we want to add styling for a custom widget?

Just like the `ExtendedTheme` you are able to define `ExtendedThemeData`.

Let's say we have a custom widget which has a couple of properties:
```dart
@ExtendedThemeData
abstract class _MyWidget {
    Color get backgroundColor;
    Color get foregroundColor;
    double? get width;
    double? get height;
    BoxShape get shape;
}
```
This will generate a class called `MyThemeData` that will hold the properties we've defined and a proper constructor.

TODO
- Add convenient methods copyWith, merge, etc
- Add default values