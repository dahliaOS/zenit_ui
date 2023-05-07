import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitTabViewExample extends StatefulWidget {
  const ZenitTabViewExample({super.key});

  @override
  State<ZenitTabViewExample> createState() => _ZenitTabViewExampleState();
}

class _ZenitTabViewExampleState extends State<ZenitTabViewExample> {
  int _selectedIndex = 0;

  List<TabData> tabs = [
    const TabData(title: "New Tab Red", leading: FlutterLogo()),
    const TabData(title: "New Tab Green", leading: FlutterLogo()),
    const TabData(title: "New Tab Blue", leading: FlutterLogo()),
  ];

  List<Container> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZenitTabBar(
          selectedIndex: _selectedIndex,
          tabs: tabs,
          onTabSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          onTabClosed: (index) {
            setState(() {
              tabs.removeAt(index);
              pages.removeAt(index);
              _selectedIndex = index - 1 < 0 ? 0 : index - 1;
            });
          },
          onAddTab: () {
            final color = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
            final hex = color.value.toRadixString(16).replaceFirst("ff", "#");
            setState(() {
              tabs.add(TabData(title: "New Tab $hex", leading: const FlutterLogo()));
              pages.add(Container(
                color: color,
              ));
              _selectedIndex = tabs.length - 1;
            });
          },
        ),
        Expanded(child: pages.elementAt(_selectedIndex)),
      ],
    );
  }
}
