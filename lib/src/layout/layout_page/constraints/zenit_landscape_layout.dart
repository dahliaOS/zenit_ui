import 'package:zenit_ui/src/layout/layout_page/list_view/zenit_layout_destination_list_view.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitLandscapeLayout extends StatefulWidget {
  const ZenitLandscapeLayout({
    super.key,
    required this.length,
    required this.selectedIndex,
    required this.pageBuilder,
    required this.onPageSelected,
    required this.destinationBuilder,
    this.controller,
    this.globalFloatingActionButton,
    this.sidebarColor,
    this.sidebarWidth = 256,
    this.sidebarToolbar,
    this.pageToolbarBuilder,
  });

  /// The number of pages in the [ZenitLandscapeLayout].
  final int length;

  final ZenitNavigationSidebarBuilder destinationBuilder;

  /// The index of the selected page.
  final int selectedIndex;

  /// Builds a page for the given index.
  final IndexedWidgetBuilder pageBuilder;

  /// Called when the user selects a page.
  final ValueChanged<int> onPageSelected;

  /// A controller that can control the index of the [ZenitLandscapeLayout].
  final ValueNotifier<int>? controller;

  /// Creates a global floating action button throughout all Pages
  final FloatingActionButton? globalFloatingActionButton;

  /// Sets the color of the sidebar
  final Color? sidebarColor;

  /// The width of the sidebar
  final double sidebarWidth;

  // Toolbar on the top of the sidebar
  final PreferredSizeWidget? sidebarToolbar;

  // Toolbar on the top of the page
  final PreferredSizeWidget? Function(BuildContext context, int index)? pageToolbarBuilder;

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
    final Color sidebarColor =
        widget.sidebarColor ?? Theme.of(context).colorScheme.background.themedLightness(context, 0.05);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: widget.sidebarWidth,
              child: DecoratedBox(
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
                      selectedIndex: selectedIndex,
                      onTap: onTap,
                      builder: widget.destinationBuilder,
                    ),
                  ),
                ),
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
            Expanded(
              child: SizedBox.expand(
                child: ZenitNavigatorPopTransactionObserver(
                  navigatorKey: _navigatorKey,
                  child: Navigator(
                    key: _navigatorKey,
                    pages: [
                      MaterialPage(
                        key: ValueKey(_selectedIndex),
                        child: Scaffold(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          appBar: widget.pageToolbarBuilder?.call(context, _selectedIndex),
                          body: widget.pageBuilder(context, _selectedIndex),
                        ),
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
          ],
        );
      },
    );
  }
}
