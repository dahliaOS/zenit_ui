import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/layout/layout_page/list_view/zenit_layout_destination_list_view.dart';
import 'package:zenit_ui/src/layout/layout_page/zenit_navigation_layout.dart';

class ZenitPortraitLayout extends StatefulWidget {
  const ZenitPortraitLayout({
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

  /// The number of pages in the [ZenitPortraitLayout].
  final int length;

  final ZenitNavigationLayoutBuilder destinationBuilder;

  /// The index of the selected page.
  final int selectedIndex;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Called when the user selects a page.
  final ValueChanged<int> onPageSelected;

  /// A controller that can control the index of the [ZenitPortraitLayout].
  final ValueNotifier<int>? controller;

  /// AppBar for the [ZenitPortraitLayout]
  final PreferredSizeWidget? appBar;

  /// Creates a global floating action button throughout all Pages
  final FloatingActionButton? globalFloatingActionButton;

  /// Page Margin
  final EdgeInsets margin;

  @override
  State<ZenitPortraitLayout> createState() => _ZenitPortraitLayoutState();
}

class _ZenitPortraitLayoutState extends State<ZenitPortraitLayout> {
  late int _selectedIndex;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    widget.controller?.addListener(controllerCallback);
  }

  // Instance of the global navigator
  NavigatorState get navigator => _navigatorKey.currentState!;

  // Notifier for the controler
  void controllerCallback() {
    navigator.popUntil((route) => route.isFirst);
  }

  void onTap(int index) {
    widget.onPageSelected(index);
    navigator.push(pageRoute(index));
    setState(() => _selectedIndex = index);
  }

  // The router for the indexed pages.
  MaterialPageRoute pageRoute(int index) {
    return MaterialPageRoute(
      builder: (context) => widget.pageBuilder(context, index),
    );
  }

  // getter for the index of the selected page.
  int get selectedIndex => _selectedIndex;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigator.maybePop().then(setPage),
      child: Padding(
        padding: (_selectedIndex != -1) ? widget.margin : EdgeInsets.zero,
        child: Navigator(
          key: _navigatorKey,
          onGenerateInitialRoutes: (navigator, initialRoute) {
            return [
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    body: ZenitLayoutDestinationListView(
                      length: widget.length,
                      selectedIndex: selectedIndex,
                      onTap: onTap,
                      builder: widget.destinationBuilder,
                    ),
                  );
                },
              ),
              if (_selectedIndex != -1) pageRoute(selectedIndex),
            ];
          },
        ),
      ),
    );
  }

  Future<bool> setPage(bool val) {
    setState(() {
      _selectedIndex = -1;
    });
    return Future.value(val);
  }
}
