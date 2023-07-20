import 'package:flutter/material.dart';
import 'package:zenit_ui/src/layout/navigator/zenit_navigator_messenger.dart';

/// A [NavigatorObserver] that updates the [ZenitNavigatorMessenger.canPop] property
/// of the nearest [ZenitNavigatorMessenger]. Both [ZenitLandscapeLayout] and [ZenitPortraitLayout]
/// use this observer as they have a nested navigator.
///
/// Using this class directly is recommended for custom usecases only and [NavigatorCanPopObserver.withContext]
/// should be preferred for default behaviour.
class ZenitNavigatorCanPopObserver extends NavigatorObserver {
  final bool canAlreadyPop;
  final ValueChanged<bool> onCanPopChanged;

  ZenitNavigatorCanPopObserver({
    required this.canAlreadyPop,
    required this.onCanPopChanged,
  });

  factory ZenitNavigatorCanPopObserver.withContext(BuildContext context) {
    return ZenitNavigatorCanPopObserver(
      canAlreadyPop: ZenitNavigatorMessenger.maybeOf(context)?.canPop ?? false,
      onCanPopChanged: (canPop) {
        ZenitNavigatorMessenger.maybeOf(context)?.notifyCanPopChanged(canPop);
      },
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _checkForUpdates();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _checkForUpdates();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _checkForUpdates();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _checkForUpdates();
  }

  void _checkForUpdates() {
    final bool canPop = navigator?.canPop() ?? false;

    if (canPop == canAlreadyPop) return;

    onCanPopChanged(canPop);
  }
}

/// A widget that listens to incoming pop transaction requests from a [ZenitNavigatorMessenger]
/// and pops the route of the provided navigator or the nearest [Navigator] ancestor.
///
/// This widget is used by [ZenitLandscapeLayout] and [ZenitPortraitLayout] and should
/// be used for custom usecases only.
class ZenitNavigatorPopTransactionObserver extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget child;

  const ZenitNavigatorPopTransactionObserver({
    this.navigatorKey,
    required this.child,
    super.key,
  });

  @override
  State<ZenitNavigatorPopTransactionObserver> createState() => _ZenitNavigatorPopTransactionObserverState();
}

class _ZenitNavigatorPopTransactionObserverState extends State<ZenitNavigatorPopTransactionObserver> {
  @override
  void didChangeDependencies() {
    final navigatorInterceptor = ZenitNavigatorMessenger.maybeOf(context);
    final bool requestedPop = navigatorInterceptor?.requestedPopTransaction ?? false;

    if (requestedPop) {
      final NavigatorState? navigator = widget.navigatorKey?.currentState ?? Navigator.maybeOf(context);

      navigator?.pop();
      navigatorInterceptor?.completeCurrentTransaction();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
