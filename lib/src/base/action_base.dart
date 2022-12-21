import 'package:flutter/services.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ActionBase extends StatefulWidget {
  const ActionBase({
    // Press
    this.onPressed,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    // Long Press
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressEnd,
    // Drag
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    // Pointer events
    this.onEnter,
    this.onHover,
    this.onExit,
    // Tertiary actions
    this.onTertiaryTapDown,
    // Cursor
    this.cursor,
    // FocusNode
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    // Margin
    this.margin,
    // Semantics
    this.semanticLabel,
    // Child
    this.child,
    // Enabled
    this.enabled = true,
    // Key
    super.key,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;
  final VoidCallback? onTapCancel;

  final VoidCallback? onLongPress;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;

  final GestureDragStartCallback? onHorizontalDragStart;
  final GestureDragUpdateCallback? onHorizontalDragUpdate;
  final GestureDragEndCallback? onHorizontalDragEnd;

  final PointerEnterEventListener? onEnter;
  final PointerHoverEventListener? onHover;
  final PointerExitEventListener? onExit;

  final MouseCursor? cursor;

  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<bool>? onFocusChange;

  final EdgeInsetsGeometry? margin;

  final String? semanticLabel;

  final Widget? child;

  final GestureTapDownCallback? onTertiaryTapDown;

  final bool enabled;

  @override
  _ActionBaseState createState() => _ActionBaseState();
}

class _ActionBaseState extends State<ActionBase> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? _createFocusNode();
  }

  @override
  void didUpdateWidget(ActionBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      node = widget.focusNode ?? node;
    }
  }

  FocusNode _createFocusNode() {
    return FocusNode(debugLabel: '${widget.runtimeType}');
  }

  @override
  void dispose() {
    if (widget.focusNode == null) node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: MergeSemantics(
        child: Semantics(
          label: widget.semanticLabel,
          button: true,
          enabled: widget.enabled,
          focusable: true,
          focused: node.hasFocus,
          child: FocusableActionDetector(
            mouseCursor: SystemMouseCursors.click,
            focusNode: node,
            autofocus: widget.autofocus,
            onFocusChange: widget.onFocusChange,
            child: MouseRegion(
              // Mouse pointer events
              onEnter: widget.onEnter,
              onHover: widget.onHover,
              onExit: widget.onExit,

              // Cursor
              cursor: widget.cursor ?? MouseCursor.defer,

              child: GestureDetector(
                // Behavior
                behavior: HitTestBehavior.opaque,
                // Press
                onTap: widget.onPressed,
                onTapDown: (_) => widget.onTapDown?.call(),
                onTapUp: (_) => widget.onTapUp?.call(),
                // Long Press
                onLongPress: widget.onLongPress,
                onLongPressStart: (_) => widget.onLongPressStart?.call(),
                onLongPressEnd: (_) => widget.onLongPressEnd?.call(),
                // Drag
                onHorizontalDragStart: widget.onHorizontalDragStart,
                onHorizontalDragUpdate: widget.onHorizontalDragUpdate,
                onHorizontalDragEnd: widget.onHorizontalDragEnd,
                //Tertiary Tap
                onTertiaryTapDown: widget.onTertiaryTapDown,
                // Child
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
