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

class _ResponsivePlatformState extends State<ResponsivePlatform> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _railAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0.0)).animate(_controller);
    _bottomnavigationAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: layoutKey,
      builder: (BuildContext context, BoxConstraints constraints) {
        final ExpansionState expansionState;
        if (constraints.maxWidth < 650) {
          expansionState = ExpansionState.small;
        } else if (constraints.maxWidth > 650 && constraints.maxWidth < 1000) {
          expansionState = ExpansionState.medium;
        } else {
          expansionState = ExpansionState.large;
        }

        final bool isExpanded =
            expansionState == ExpansionState.large || expansionState == ExpansionState.medium;

        isExpanded ? _controller.reverse() : _controller.forward();

        final double navRailPadding = expansionState == ExpansionState.large ? 256 : 80.0;

        final bool railIsExpanded = expansionState == ExpansionState.large;

        return Scaffold(
          appBar: widget.appBar,
          floatingActionButton: widget.floatingActionButton,
          body: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) => Padding(
                  padding: EdgeInsets.only(
                    left: Tween<double>(begin: navRailPadding, end: 0.0).animate(_controller).value,
                    bottom: Tween<double>(begin: 0.0, end: 56.0).animate(_controller).value,
                  ),
                  child: child,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: widget.body,
                ),
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
                    railWidth: navRailPadding,
                    isExpanded: railIsExpanded,
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
    required this.isExpanded,
    required this.railWidth,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int>? onTap;
  final List<NavigationElement> navigationElements;
  final bool isExpanded;
  final double railWidth;

  @override
  Widget build(BuildContext context) {
    final ZenitTheme theme = ZenitTheme.of(context);


    return SizedBox(
      width: railWidth,
      child: Theme(
        data: Theme.of(context).copyWith(
          useMaterial3: true,
        ),
        child: NavigationRail(
          extended: isExpanded,
          backgroundColor: theme.surfaceColor,
          selectedIndex: selectedIndex,
          indicatorColor: theme.primaryColor,
          onDestinationSelected: onTap,
          labelType: isExpanded ? NavigationRailLabelType.none : NavigationRailLabelType.all,
          destinations: navigationElements.map(
            (NavigationElement element) {
              return NavigationRailDestination(
                icon: Icon(element.icon),
                label: Text(element.title),
                selectedIcon: Icon(element.selectedIcon),
              );
            },
          ).toList(),
        ),
      ),
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

    IconThemeData? getIconTheme(Set<MaterialState> states) {
      if (states.any([MaterialState.selected].contains)) {
        return IconThemeData(
          color: theme.backgroundColor,
        );
      }
      return null;
    }

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: theme.primaryColor,
        iconTheme: MaterialStateProperty.resolveWith(getIconTheme),
        labelTextStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 12)),
      ),
      child: NavigationBar(
        backgroundColor: theme.surfaceColor,
        elevation: 0.0,
        height: 64,
        selectedIndex: selectedIndex,
        onDestinationSelected: onTap,
        destinations: navigationElements
            .map(
              (NavigationElement element) => NavigationDestination(
                icon: Icon(element.icon),
                label: element.title,
                selectedIcon: Icon(element.selectedIcon),
              ),
            )
            .toList(),
      ),
    );
  }
}

//TODO Implement this
enum DesktopNavigationType { rail, top }

enum ExpansionState { small, medium, large }
