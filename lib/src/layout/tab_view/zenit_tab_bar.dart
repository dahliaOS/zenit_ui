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
    required this.onTabSelected,
    required this.onTabClosed,
    required this.tabs,
    this.onAddTab,
  });

  /// Selected index
  final int selectedIndex;

  /// Called when the user selects a tab.
  final ValueChanged<int> onTabSelected;

  /// Called when the user closes a tab
  final ValueSetter<int> onTabClosed;

  final VoidCallback? onAddTab;

  final List<TabData> tabs;

  @override
  State<ZenitTabBar> createState() => _ZenitTabBarState();
}

class _ZenitTabBarState extends State<ZenitTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListView.builder(
              itemCount: widget.onAddTab != null ? widget.tabs.length + 1 : widget.tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index < widget.tabs.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ZenitTab(
                      icon: widget.tabs.elementAt(index).leading,
                      title: widget.tabs.elementAt(index).title,
                      onPressed: () => widget.onTabSelected(index),
                      onClose: () => widget.onTabClosed(index),
                      selected: widget.selectedIndex == index,
                    ),
                  );
                } else {
                  return IconButton(
                    constraints: const BoxConstraints.tightFor(height: 40, width: 40),
                    padding: EdgeInsets.zero,
                    onPressed: widget.onAddTab,
                    icon: const Icon(Icons.add),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
