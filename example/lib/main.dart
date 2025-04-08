import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/pages.dart';

void main() async {
  // Check for repainting
  //debugRepaintRainbowEnabled = true;
  await ZenitWindowTitlebar.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
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
        titlebar: const ZenitWindowTitlebar(),
        sidebarWidth: 280,
        sidebarToolbar: const ZenitToolbar(
          title: ZenitWindowTitle(fallback: "ZenitUI Example"),
          backgroundColor: Colors.transparent,
        ),
        pageToolbarBuilder: (context, index) => ZenitToolbar(
          height: 48,
          title: examplePages[index].titleBuilder(context),
          backgroundColor: Colors.transparent,
        ),
        length: examplePages.length,
        destinationBuilder: (context, index, selected) => ZenitLayoutTile(
          title: examplePages[index].titleBuilder(context),
          leading: examplePages[index].iconBuilder(context, selected),
          selected: selected,
        ),
        pageBuilder: (context, index) => examplePages[index].pageBuilder(context),
        globalFloatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => (themeMode < themeModes.length - 1) ? themeMode++ : themeMode = 0),
          tooltip: resolveThemeName(),
          child: Icon(resolveThemeIcon()),
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
