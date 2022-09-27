import 'package:flutter/material.dart';
import 'package:zenit_ui/src/layout/responsive/navigation_element.dart';
import 'package:zenit_ui/src/theme/theme.dart';

Key layoutKey = UniqueKey();

class ResponsivePlatform extends StatefulWidget {
  final bool disableAnimation;
  final List<NavigationElement> navigationElements;
  final ValueChanged<int>? onTap;
  final int selectedIndex;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? body;

  const ResponsivePlatform({
    super.key,
    required this.navigationElements,
    this.disableAnimation = false,
    this.onTap,
    required this.selectedIndex,
    this.appBar,
    this.floatingActionButton,
    this.body,
  }) : assert(
          navigationElements.length > 2,
          "You need at least 3 navigation elements",
        );

  @override
  State<ResponsivePlatform> createState() => _ResponsivePlatformState();
}

late AnimationController _controller;
late Animation<Offset> _railAnimation;
late Animation<Offset> _bottomnavigationAnimation;

class _ResponsivePlatformState extends State<ResponsivePlatform>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _railAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0.0))
            .animate(_controller);
    _bottomnavigationAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: layoutKey,
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isExpanded = constraints.maxWidth > 650;

        isExpanded ? _controller.reverse() : _controller.forward();

        return Scaffold(
          appBar: widget.appBar,
          floatingActionButton: widget.floatingActionButton,
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAlias,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) => Padding(
                  padding: EdgeInsets.only(
                    left: Tween<double>(begin: 72.0, end: 0.0)
                        .animate(_controller)
                        .value,
                    bottom: Tween<double>(begin: 0.0, end: 56.0)
                        .animate(_controller)
                        .value,
                  ),
                  child: child,
                ),
                child: widget.body,
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                top: 0.0,
                child: SlideTransition(
                  position: _railAnimation,
                  child: _NavigationRail(
                    selectedIndex: widget.selectedIndex,
                    onTap: widget.onTap,
                    navigationElements: widget.navigationElements,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: SlideTransition(
                  position: _bottomnavigationAnimation,
                  child: _BottomNavigationBar(
                    selectedIndex: widget.selectedIndex,
                    onTap: widget.onTap,
                    navigationElements: widget.navigationElements,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavigationRail extends StatelessWidget {
  const _NavigationRail({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
    required this.navigationElements,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final List<NavigationElement> navigationElements;

  @override
  Widget build(BuildContext context) {
    final ZenitTheme theme = ZenitTheme.of(context);

    return NavigationRail(
      backgroundColor: theme.surfaceColor,
      selectedIndex: selectedIndex,
      indicatorColor: theme.primaryColor,
      onDestinationSelected: onTap,
      labelType: NavigationRailLabelType.all,
      destinations: navigationElements.map(
        (NavigationElement element) {
          return NavigationRailDestination(
            icon: Icon(element.icon),
            label: Text(element.title),
          );
        },
      ).toList(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
    required this.navigationElements,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final List<NavigationElement> navigationElements;

  @override
  Widget build(BuildContext context) {
    final ZenitTheme theme = ZenitTheme.of(context);
    return BottomNavigationBar(
      backgroundColor: theme.surfaceColor,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: theme.primaryColor,
      items: navigationElements
          .map(
            (NavigationElement element) => BottomNavigationBarItem(
              icon: Icon(element.icon),
              label: element.title,
            ),
          )
          .toList(),
    );
  }
}

//TODO Implement this
enum DesktopNavigationType { rail, top }
