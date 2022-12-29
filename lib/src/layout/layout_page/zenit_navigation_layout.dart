import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/layout/layout_page/constraints/zenit_landscape_layout.dart';
import 'package:zenit_ui/src/layout/layout_page/constraints/zenit_portrait_layout.dart';
import 'package:zenit_ui/src/layout/navigator/zenit_navigator_interceptor.dart';

typedef ZenitNavigationLayoutBuilder = Widget Function(
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
    this.appBar,
    this.globalFloatingActionButton,
    this.margin = kDefaultPageMargin,
  });

  /// The number of pages in the [ZenitNavigationLayout].
  final int length;

  /// Builds a destination for the given index.
  final ZenitNavigationLayoutBuilder destinationBuilder;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Specifies the initial index for the [ZenitNavigationLayout].
  final int? initialIndex;

  /// Called when the user selects a page.
  final ValueChanged<int?>? onPageSelected;

  /// A controller that can control the index of the [ZenitNavigationLayout].
  final ValueNotifier<int>? controller;

  /// The ZenitNavigationLayout AppBar
  final PreferredSizeWidget? appBar;

  /// Creates a global floating action button throughout all Pages
  final FloatingActionButton? globalFloatingActionButton;

  /// Page Margin
  final EdgeInsets margin;

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
        appBar: widget.appBar,
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
                appBar: widget.appBar,
                globalFloatingActionButton: widget.globalFloatingActionButton,
                margin: widget.margin,
              );
            } else {
              return ZenitLandscapeLayout(
                destinationBuilder: widget.destinationBuilder,
                pageBuilder: widget.pageBuilder,
                length: widget.length,
                selectedIndex: _index == -1 ? _previousIndex : _index,
                onPageSelected: setIndex,
                controller: widget.controller,
                appBar: widget.appBar,
                margin: widget.margin,
              );
            }
          },
        ),
      ),
    );
  }
}
