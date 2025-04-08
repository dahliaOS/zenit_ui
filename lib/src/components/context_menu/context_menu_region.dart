import 'package:flutter/material.dart';
import 'package:zenit_ui/src/components/context_menu/context_menu.dart';

class ZenitContextMenuRegion extends StatelessWidget {
  /// Creates an instance of [ZenitContextMenuRegion].
  const ZenitContextMenuRegion({
    super.key,
    required this.child,
    required this.contextMenu,
  });

  /// Builds the context menu.
  final ZenitContextMenuData contextMenu;

  /// The child widget that will be listened to for gestures.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ZenitContextMenuBuilder(
      contextMenu: contextMenu,
      child: child,
      builder: (context, controller, builderChild) => GestureDetector(
        onTap: controller.isOpen ? controller.close : null,
        onSecondaryTap: controller.isOpen ? controller.close : null,
        onSecondaryTapUp: (event) => controller.isOpen ? controller.close : controller.open(position: event.localPosition),
        child: builderChild,
      ),
    );
  }
}
