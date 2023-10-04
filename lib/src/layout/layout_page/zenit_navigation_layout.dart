import 'package:flutter/material.dart';
import 'package:zenit_ui/src/layout/layout_page/constraints/zenit_landscape_layout.dart';
import 'package:zenit_ui/src/layout/layout_page/constraints/zenit_portrait_layout.dart';
import 'package:zenit_ui/src/layout/navigator/zenit_navigator_messenger.dart';

typedef ZenitNavigationSidebarBuilder = Widget Function(
  BuildContext context,
  int index,
  bool selected,
);

class ZenitNavigationLayout extends StatefulWidget {
  const ZenitNavigationLayout({
    super.key,
    required this.length,
    required this.destinationBuilder,
    required this.pageBuilder,
    this.initialIndex,
    this.onPageSelected,
    this.controller,
    this.titlebar,
    this.globalFloatingActionButton,
    this.sidebarColor,
    this.sidebarWidth = 256,
    this.sidebarToolbar,
    this.pageToolbarBuilder,
  });

  /// The number of pages in the [ZenitNavigationLayout].
  final int length;

  /// Builds a destination for the given index.
  final ZenitNavigationSidebarBuilder destinationBuilder;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Specifies the initial index for the [ZenitNavigationLayout].
  final int? initialIndex;

  /// Called when the user selects a page.
  final ValueChanged<int?>? onPageSelected;

  /// A controller that can control the index of the [ZenitNavigationLayout].
  final ValueNotifier<int>? controller;

  /// The ZenitNavigationLayout AppBar
  final PreferredSizeWidget? titlebar;

  /// Creates a global floating action button throughout all Pages
  final Widget? globalFloatingActionButton;

  /// Sets the color of the sidebar
  final Color? sidebarColor;

  /// Sets the width of the sidebar
  final double sidebarWidth;

  // Toolbar on the top of the sidebar
  final PreferredSizeWidget? sidebarToolbar;

  // Toolbar on the top of the page
  final PreferredSizeWidget? Function(BuildContext context, int index)? pageToolbarBuilder;

  @override
  State<ZenitNavigationLayout> createState() => _ZenitNavigationLayoutState();
}

class _ZenitNavigationLayoutState extends State<ZenitNavigationLayout> {
  int _index = -1;
  int _previousIndex = 0;

  void setIndex(int index) {
    _previousIndex = _index;
    _index = index;
    widget.onPageSelected?.call(index == -1 ? null : index);
  }

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex ?? -1;
  }

  @override
  void didUpdateWidget(covariant ZenitNavigationLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      _index = widget.initialIndex ?? -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ZenitNavigatorMessengerHost(
      child: Scaffold(
        floatingActionButton: widget.globalFloatingActionButton,
        extendBodyBehindAppBar: true,
        appBar: widget.titlebar,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 620) {
              return ZenitPortraitLayout(
                destinationBuilder: widget.destinationBuilder,
                pageBuilder: widget.pageBuilder,
                length: widget.length,
                selectedIndex: _index,
                onPageSelected: setIndex,
                controller: widget.controller,
                sidebarColor: widget.sidebarColor,
                sidebarToolbar: widget.sidebarToolbar,
                pageToolbarBuilder: widget.pageToolbarBuilder,
              );
            } else {
              return ZenitLandscapeLayout(
                destinationBuilder: widget.destinationBuilder,
                pageBuilder: widget.pageBuilder,
                length: widget.length,
                selectedIndex: _index == -1 ? _previousIndex : _index,
                onPageSelected: setIndex,
                controller: widget.controller,
                sidebarColor: widget.sidebarColor,
                sidebarWidth: widget.sidebarWidth,
                sidebarToolbar: widget.sidebarToolbar,
                pageToolbarBuilder: widget.pageToolbarBuilder,
              );
            }
          },
        ),
      ),
    );
  }
}
