import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/layout/layout_page/list_view/zenit_layout_destination_list_view.dart';
import 'package:zenit_ui/src/layout/layout_page/zenit_navigation_layout.dart';
import 'package:zenit_ui/src/layout/navigator/zenit_navigator_observer.dart';

class ZenitLandscapeLayout extends StatefulWidget {
  const ZenitLandscapeLayout({
    super.key,
    required this.length,
    required this.selectedIndex,
    required this.pageBuilder,
    required this.onPageSelected,
    required this.destinationBuilder,
    this.controller,
    this.appBar,
    this.globalFloatingActionButton,
    this.margin = kDefaultPageMargin,
  });

  /// The number of pages in the [ZenitLandscapeLayout].
  final int length;

  final ZenitNavigationLayoutBuilder destinationBuilder;

  /// The index of the selected page.
  final int selectedIndex;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Called when the user selects a page.
  final ValueChanged<int> onPageSelected;

  /// A controller that can control the index of the [ZenitLandscapeLayout].
  final ValueNotifier<int>? controller;

  /// AppBar for the [ZenitLandscapeLayout]
  final PreferredSizeWidget? appBar;

  /// Creates a global floating action button throughout all Pages
  final FloatingActionButton? globalFloatingActionButton;

  /// Page Margin
  final EdgeInsets margin;

  @override
  State<ZenitLandscapeLayout> createState() => _ZenitLandscapeLayoutState();
}

class _ZenitLandscapeLayoutState extends State<ZenitLandscapeLayout> {
  late int _selectedIndex;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    widget.controller?.addListener(controllerCallback);
  }

  // Notifier for the controler
  void controllerCallback() {
    onTap(widget.controller!.value);
  }

  void onTap(int index) {
    widget.onPageSelected(index);
    setState(() => _selectedIndex = index);
  }

  // getter for the index of the selected page.
  int get selectedIndex => _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 256,
              child: Padding(
                padding: widget.margin,
                child: Scaffold(
                  body: ZenitLayoutDestinationListView(
                    length: widget.length,
                    selectedIndex: selectedIndex,
                    onTap: onTap,
                    builder: widget.destinationBuilder,
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              width: 1,
            ),
            Expanded(
              child: SizedBox.expand(
                child: ClipRRect(
                  child: Padding(
                    padding: widget.margin,
                    child: ZenitNavigatorPopTransactionObserver(
                      navigatorKey: _navigatorKey,
                      child: Navigator(
                        key: _navigatorKey,
                        pages: [
                          MaterialPage(
                            key: ValueKey(_selectedIndex),
                            child: widget.pageBuilder(context, _selectedIndex),
                          ),
                        ],
                        onPopPage: (route, result) => route.didPop(result),
                        observers: [
                          ZenitNavigatorCanPopObserver.withContext(context),
                          HeroController(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
