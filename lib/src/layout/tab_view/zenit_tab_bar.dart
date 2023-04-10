import 'package:flutter/material.dart';
import 'package:zenit_ui/src/layout/tab_view/tab.dart';
import 'package:zenit_ui/src/layout/tab_view/tab_data.dart';

typedef ZenitTabBuilder = Widget Function(
  BuildContext context,
  int index,
  bool selected,
);

class ZenitTabBar extends StatefulWidget {
  const ZenitTabBar({
    super.key,
    required this.selectedIndex,
    required this.tabCount,
    required this.pageBuilder,
    required this.onTabSelected,
    required this.onTabClosed,
    this.tabData,
  });

  /// Selected index
  final int selectedIndex;

  /// Amount of tabs
  final int tabCount;

  /// Builder for the specific pages
  final IndexedWidgetBuilder pageBuilder;

  /// Called when the user selects a tab.
  final ValueChanged<int> onTabSelected;

  /// Called when the user closes a tab
  final ValueSetter<int> onTabClosed;

  final TabData? tabData;

  @override
  State<ZenitTabBar> createState() => _ZenitTabBarState();
}

class _ZenitTabBarState extends State<ZenitTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListView.builder(
              itemCount: widget.tabCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ZenitTab(
                  icon: widget.tabData?.leading ??
                      const FlutterLogo(
                        size: 16,
                      ),
                  title: widget.tabData?.title ?? "Tab",
                  onPressed: () => setState(() {
                    _selectedIndex = index;
                  }),
                  onClose: () => widget.onTabClosed(index),
                  enabled: _selectedIndex == index,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: widget.pageBuilder(context, _selectedIndex),
        )
      ],
    );
  }
}
