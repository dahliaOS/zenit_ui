import 'dart:math';

import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: value ? ThemeMode.dark : ThemeMode.light,
      theme: ExampleTheme.lightTheme,
      darkTheme: ExampleTheme.darkTheme,
      home: Scaffold(
        
        body: Column(
          children: [
            tabView(),
            zenitComponents(),
          ],
        ),
      ),
    );
  }

  Widget tabView() {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: Center(
          child: TabView(
            pages: List.generate(
              10,
              (index) => TabViewPage(
                title: "Tab $index",
                view: Container(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget zenitComponents() {
    return Expanded(
      child: Center(
        child: Transform.scale(
          scale: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                onPressed: () => print("PrimaryButton was clicked"),
                backgroundColor: ZenitColors.blue,
                foregroundColor: const Color(0xffffffff),
                child: const Text(
                  "Primary Button",
                ),
              ),
              const Gap(16),
              SecondaryButton(
                onPressed: () => print("SecondaryButton was clicked"),
                child: const Text(
                  "Secondary Button",
                ),
              ),
              const Gap(16),
              Switch(
                value: value,
                onChanged: (val) => setState(() => value = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
