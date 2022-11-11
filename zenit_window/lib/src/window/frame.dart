import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

final _kIsLinux = !kIsWeb && Platform.isLinux;
final _kIsWindows = !kIsWeb && Platform.isWindows;

double get kZenitWindowFrameMargin => _kIsLinux ? 20.0 : 0;

class ZenitWindowFrame extends StatefulWidget {
  /// The [child] contained by the ZenitWindowFrame.
  final Widget child;

  const ZenitWindowFrame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZenitWindowFrameState();
}

class _ZenitWindowFrameState extends State<ZenitWindowFrame> with WindowListener {
  bool _isFocused = true;
  bool _isMaximized = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Widget _buildZenitWindowFrame(BuildContext context) {
    return Container(
      margin: (_isMaximized || _isFullScreen) ? EdgeInsets.zero : EdgeInsets.all(kZenitWindowFrameMargin),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: (_isMaximized || _isFullScreen) ? 0 : 1,
        ),
        borderRadius: BorderRadius.circular(
          (_isMaximized || _isFullScreen) ? 0 : 12,
        ),
        boxShadow: <BoxShadow>[
          if (!_isMaximized && !_isFullScreen)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0.0, _isFocused ? 4 : 2),
              blurRadius: 12,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          (_isMaximized || _isFullScreen) ? 0 : 12,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_kIsLinux) {
      return DragToResizeArea(
        resizeEdgeMargin:
            (_isMaximized || _isFullScreen) ? EdgeInsets.zero : EdgeInsets.all(kZenitWindowFrameMargin * 0.6),
        enableResizeEdges: (_isMaximized || _isFullScreen) ? [] : null,
        child: _buildZenitWindowFrame(context),
      );
    } else if (_kIsWindows) {
      return DragToResizeArea(
        enableResizeEdges: (_isMaximized || _isFullScreen)
            ? []
            : [
                ResizeEdge.topLeft,
                ResizeEdge.top,
                ResizeEdge.topRight,
              ],
        child: widget.child,
      );
    }

    return widget.child;
  }

  @override
  void onWindowFocus() {
    setState(() {
      _isFocused = true;
    });
  }

  @override
  void onWindowBlur() {
    setState(() {
      _isFocused = false;
    });
  }

  @override
  void onWindowMaximize() {
    setState(() {
      _isMaximized = true;
    });
  }

  @override
  void onWindowUnmaximize() {
    setState(() {
      _isMaximized = false;
    });
  }

  @override
  void onWindowEnterFullScreen() {
    setState(() {
      _isFullScreen = true;
    });
  }

  @override
  void onWindowLeaveFullScreen() {
    setState(() {
      _isFullScreen = false;
    });
  }
}

// ignore: non_constant_identifier_names
TransitionBuilder ZenitWindowFrameInit() {
  return (_, Widget? child) {
    return ZenitWindowFrame(
      child: child!,
    );
  };
}
