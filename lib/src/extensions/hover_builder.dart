import 'package:zenit_ui/zenit_ui.dart';

class HoverBuilder extends StatefulWidget {
  final Widget Function(BuildContext, bool, Widget?) builder;
  final Widget? child;
  final MouseCursor? cursor;

  const HoverBuilder({
    super.key,
    required this.builder,
    this.child,
    this.cursor,
  });

  @override
  _HoverBuilderState createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool isHovering = false;

  @override
  void dispose() {
    isHovering = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor ?? MouseCursor.defer,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: widget.builder(context, isHovering, widget.child),
    );
  }
}
