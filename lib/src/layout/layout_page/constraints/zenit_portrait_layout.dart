import 'package:zenit_ui/src/layout/layout_page/list_view/zenit_layout_destination_list_view.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitPortraitLayout extends StatefulWidget {
  const ZenitPortraitLayout({
    super.key,
    required this.length,
    required this.selectedIndex,
    required this.pageBuilder,
    required this.onPageSelected,
    required this.destinationBuilder,
    this.controller,
    this.sidebarColor,
    this.sidebarToolbar,
    this.pageToolbarBuilder,
  });

  /// The number of pages in the [ZenitPortraitLayout].
  final int length;

  final ZenitNavigationSidebarBuilder destinationBuilder;

  /// The index of the selected page.
  final int selectedIndex;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Called when the user selects a page.
  final ValueChanged<int> onPageSelected;

  /// A controller that can control the index of the [ZenitPortraitLayout].
  final ValueNotifier<int>? controller;

  /// Sets the color of the sidebar
  final Color? sidebarColor;

  // Toolbar on the top of the sidebar
  final PreferredSizeWidget? sidebarToolbar;

  // Toolbar on the top of the page
  final PreferredSizeWidget? Function(BuildContext context, int index)? pageToolbarBuilder;

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
      builder: (context) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: widget.pageToolbarBuilder?.call(context, index),
        body: widget.pageBuilder(context, index),
      ),
    );
  }

  // getter for the index of the selected page.
  int get selectedIndex => _selectedIndex;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    final sidebarColor = widget.sidebarColor ?? Theme.of(context).colorScheme.background.themedLightness(context, 0.05);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) async => !await navigator.maybePop().then(setPage),
      child: ZenitNavigatorPopTransactionObserver(
        navigatorKey: _navigatorKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
                TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
                TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          child: Navigator(
            key: _navigatorKey,
            observers: [ZenitNavigatorCanPopObserver.withContext(context)],
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(
                  builder: (context) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: sidebarColor,
                      ),
                      child: Scaffold(
                        backgroundColor: sidebarColor,
                        appBar: widget.sidebarToolbar,
                        body: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ZenitLayoutDestinationListView(
                            length: widget.length,
                            selectedIndex: -1,
                            onTap: onTap,
                            builder: widget.destinationBuilder,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (_selectedIndex != -1) pageRoute(selectedIndex),
              ];
            },
          ),
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
