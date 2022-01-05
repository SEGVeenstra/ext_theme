import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Let's define our themes
final smallTheme = MyThemeData(
  themeData: ThemeData(),
  customWidget: CustomWidgetData(
    backgroundColor: Colors.red,
    height: 64,
    width: 64,
    shape: BoxShape.circle,
  ),
  spaces: SpacesData(), // we'll use the defaults
);

final largeTheme = MyThemeData(
  themeData: ThemeData(),
  customWidget: CustomWidgetData(
    backgroundColor: Colors.blue,
    height: 128,
    width: 128,
    shape: BoxShape.rectangle,
  ),
  spaces: SpacesData(
    small: 16,
    medium: 48,
    large: 64,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExtendedTheme Demo',
      builder: MyTheme.builder(light: smallTheme), // We'll use smallTheme as our default
      home: Scaffold(
        body: WidgetSwither(
            widget1: const CustomWidget(), // This CustomWidget will use the smallTheme
            widget2: MyTheme(
              light: largeTheme,
              child: const CustomWidget(), // This CustomWidget has been wrapped MyTheme with largeTheme
            )),
      ),
    );
  }
}

class WidgetSwither extends StatefulWidget {
  final Widget widget1;
  final Widget widget2;
  const WidgetSwither({
    required this.widget1,
    required this.widget2,
    Key? key,
  }) : super(key: key);

  @override
  _WidgetSwitherState createState() => _WidgetSwitherState();
}

class _WidgetSwitherState extends State<WidgetSwither> {
  late Widget current;

  @override
  void initState() {
    current = widget.widget1;
    super.initState();
  }

  void switchWidget() {
    if (current == widget.widget1) {
      setState(() {
        current = widget.widget2;
      });
    } else {
      setState(() {
        current = widget.widget1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => switchWidget(),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: current,
        ));
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = MyTheme.of(context);
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: myTheme.customWidget.width,
              height: myTheme.customWidget.height,
              decoration: BoxDecoration(
                shape: myTheme.customWidget.shape,
                // Because backgroundColor is optional, we can fallback onto the default ThemeData
                color: myTheme.customWidget.backgroundColor ?? myTheme.themeData.colorScheme.primary,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(color: myTheme.customWidget.backgroundColor)),
              SizedBox(width: myTheme.spaces.small),
              Expanded(child: Container(color: myTheme.customWidget.backgroundColor)),
              SizedBox(width: myTheme.spaces.medium),
              Expanded(child: Container(color: myTheme.customWidget.backgroundColor)),
              SizedBox(width: myTheme.spaces.large),
              Expanded(child: Container(color: myTheme.customWidget.backgroundColor)),
            ],
          ),
        ),
      ],
    );
  }
}
