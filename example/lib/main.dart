import 'package:flutter/material.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/pages.dart';

void main() async {
  // Check for repainting
  //debugRepaintRainbowEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int themeMode = 0;
  Set<ThemeMode> themeModes = {ThemeMode.system, ThemeMode.light, ThemeMode.dark};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeModes.elementAt(themeMode),
      theme: createZenitTheme(brightness: Brightness.light),
      darkTheme: createZenitTheme(brightness: Brightness.dark),
      home: ZenitNavigationLayout(
        length: examplePages.length,
        destinationBuilder: (context, index, selected) => ZenitLayoutTile(
          title: examplePages[index].titleBuilder(context),
          leading: examplePages[index].iconBuilder(context, selected),
          selected: selected,
        ),
        pageBuilder: (context, index) => examplePages[index].pageBuilder(context),
        globalFloatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() => (themeMode < themeModes.length - 1) ? themeMode++ : themeMode = 0),
          label: Text(resolveThemeName()),
          icon: Icon(resolveThemeIcon()),
        ),
      ),
    );
  }

  String resolveThemeName() {
    switch (themeModes.elementAt(themeMode)) {
      case ThemeMode.system:
        return "System";
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
    }
  }

  IconData resolveThemeIcon() {
    switch (themeModes.elementAt(themeMode)) {
      case ThemeMode.system:
        return Icons.devices_rounded;
      case ThemeMode.light:
        return Icons.light_mode_rounded;
      case ThemeMode.dark:
        return Icons.dark_mode_rounded;
    }
  }
}
