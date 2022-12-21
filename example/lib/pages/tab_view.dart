import 'dart:math';

import 'package:zenit_ui/zenit_ui.dart';

class ZenitTabViewExample extends StatefulWidget {
  const ZenitTabViewExample({super.key});

  @override
  State<ZenitTabViewExample> createState() => _ZenitTabViewExampleState();
}

class _ZenitTabViewExampleState extends State<ZenitTabViewExample> {
  @override
  Widget build(BuildContext context) {
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
