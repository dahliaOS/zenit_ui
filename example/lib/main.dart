import 'dart:math';

import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/theme/theme.dart';
import 'package:zenit_window/zenit_window.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

int _selectedIndex = 0;

class _MyAppState extends State<MyApp> {
  bool value = false;
  bool darkMode = false;
  double val = 0.5;
  @override
  Widget build(BuildContext context) {
    return ZenitWindow(
      debugShowCheckedModeBanner: false,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ExampleTheme.lightTheme,
      darkTheme: ExampleTheme.darkTheme,
      home: ResponsivePlatform(
        floatingActionButton: FloatingActionButton(
          tooltip: "Toggle Theme Mode",
          child: Icon(darkMode ? Icons.sunny : Icons.dark_mode),
          onPressed: () => setState(() {
            darkMode = !darkMode;
          }),
        ),
        titlebar: const TitleBar(),
        selectedIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        navigationElements: [
          NavigationElement(
            title: "Elements",
            icon: Icons.toggle_on_outlined,
            selectedIcon: Icons.toggle_on,
          ),
          NavigationElement(
            title: "Tabs",
            icon: Icons.tab_outlined,
            selectedIcon: Icons.tab,
          ),
          NavigationElement(
            title: "Emptyness",
            icon: Icons.pages_outlined,
            selectedIcon: Icons.pages,
          ),
        ],
        body: [
          zenitComponents(),
          tabView(),
          ListView(
            children: [
              const ListTile(
                title: Text("Default ListTile"),
                subtitle: Text("subtitle"),
              ),
              SwitchListTile(
                title: const Text("ZenitSwitchListTile"),
                subtitle: const Text("subtitle"),
                value: value,
                onChanged: (val) => setState(() => value = val),
              ),
            ],
          ),
        ].elementAt(_selectedIndex),
      ),
    );
  }

  Widget tabView() {
    return Container(
      color: Colors.red,
      child: Center(
        child: TabView(
          onNewPage: () {
            _tabs.add(
              TabViewPage(
                title: "Tab ${_tabs.length}",
                view: Container(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
            );
          },
          pages: _tabs,
        ),
      ),
    );
  }

  Widget zenitComponents() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(48),
          Image.asset(
            "assets/banner.png",
            width: 557,
            height: 192,
          ),
          const Gap(48),
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
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 325,
            child: Card(
              child: ListTile(
                title: const Text("Theme Mode"),
                subtitle: Text(value ? "Dark" : "Light"),
                onTap: () => setState(() => value = !value),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioButton(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                    const Gap(8),
                    Checkbox(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                    const Gap(8),
                    Switch(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(48),
        ],
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
