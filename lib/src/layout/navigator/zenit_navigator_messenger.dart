import 'package:flutter/material.dart';

/// A widget that hosts a [ZenitNavigatorMessenger] provider.
///
/// [ZenitNavigationLayout] uses it and is the recommended way to use this, you should
/// directly construct this widget only if you need custom usecases.
class ZenitNavigatorMessengerHost extends StatefulWidget {
  final Widget child;

  const ZenitNavigatorMessengerHost({
    required this.child,
    super.key,
  });

  @override
  State<ZenitNavigatorMessengerHost> createState() => _ZenitNavigatorMessengerHostState();
}

class _ZenitNavigatorMessengerHostState extends State<ZenitNavigatorMessengerHost> {
  bool _canPop = false;
  bool _requestedPopTransaction = false;
  bool _lastCanPop = false;

  @override
  void setState(VoidCallback fn) {
    _requestedPopTransaction = false;

    super.setState(fn);
  }

  void requestPopTransaction() {
    setState(() {
      _requestedPopTransaction = true;
    });
  }

  void setCanPop(bool canPop) {
    _canPop = canPop;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZenitNavigatorMessenger._(
      state: this,
      child: widget.child,
    );
  }
}

/// An [InheritedWidget] with the sole purpose of allowing parts of the ui to communicate
/// with navigators that aren't above them but might be part of complex widget graphs.
///
/// Used by [ZenitWindowTitlebar] to connect to descendant navigators to know if it
/// needs to show the back button or not and, in case, request a pop.
///
/// As of now it supports only two operations, checking if the current navigator can pop
/// and requesting a pop transaction for it.
///
/// To get this [InheritedWidget] inside your context you need to wrap your layout in
/// [ZenitNavigationLayout] or [ZenitNavigatorMessengerHost].
class ZenitNavigatorMessenger extends InheritedWidget {
  final _ZenitNavigatorMessengerHostState _state;

  const ZenitNavigatorMessenger._({
    required _ZenitNavigatorMessengerHostState state,
    required super.child,
  }) : _state = state;

  /// Notify listeners that the canPop status for the interceptor changed
  void notifyCanPopChanged(bool canPop) => _state.setCanPop(canPop);

  /// Get whether the current navigator allows for popping routes. Might not always
  /// be accurate as there is no direct dependency but it's more of a responsibility.
  ///
  /// [notifyCanPopChanged] must be called for this to be updated.
  bool get canPop => _state._canPop;

  /// Requests a pop to be performed on the current listening navigator.
  void requestPopTransaction() => _state.requestPopTransaction();

  /// Notify the requested transaction has completed and the page has been popped,
  /// usually it's not recommended to call this method directly and you should instead
  /// use [NavigatorPopTransactionObserver].
  void completeCurrentTransaction() => _state._requestedPopTransaction = false;

  /// Whether a pop transaction was requested.
  /// It's not advised to use this directly but instead you should use [NavigatorPopTransactionObserver].
  bool get requestedPopTransaction => _state._requestedPopTransaction;

  /// Get the closest [ZenitNavigatorMessenger] ancestor if any is available.
  /// If it's not, return `null`.
  static ZenitNavigatorMessenger? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ZenitNavigatorMessenger>();
  }

  /// Get the closest [ZenitNavigatorMessenger] ancestor if any is available.
  /// Throws an exception if there is none.
  static ZenitNavigatorMessenger of(BuildContext context) {
    return maybeOf(context)!;
  }

  @override
  bool updateShouldNotify(
    covariant ZenitNavigatorMessenger old,
  ) {
    final bool canPopChanged = _state._lastCanPop != _state._canPop;
    _state._lastCanPop = _state._canPop;
    return canPopChanged || _state._requestedPopTransaction;
  }
}
