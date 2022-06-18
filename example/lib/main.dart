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
  double val = 0.5;
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
            onNewPage: () {
              _tabs.add(
                TabViewPage(
                  title: "Tab ${_tabs.length}",
                  view: Container(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                ),
              );
            },
            pages: _tabs,
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
              const Gap(16),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    label: Text("Text Box"),
                  ),
                ),
              ),
              const Gap(16),
              SizedBox(
                  width: 325,
                  child: Slider(
                    value: val,
                    onChanged: (value) => setState(() => val = value),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

final _tabs = List.generate(
  3,
  (index) => TabViewPage(
    title: "Tab $index",
    view: Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    ),
  ),
);
