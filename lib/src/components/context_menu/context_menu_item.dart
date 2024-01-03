import 'package:zenit_ui/zenit_ui.dart';

sealed class ContextMenuEntry {
  const ContextMenuEntry();
}

class ZenitContextMenuItem extends ContextMenuEntry {
  final String label;
  final MenuSerializableShortcut? shortcut;
  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? trailing;

  const ZenitContextMenuItem({
    required this.label,
    this.shortcut,
    this.onPressed,
    this.leading,
    this.trailing,
  });
}

class ZenitNestedContextMenuItem extends ContextMenuEntry {
  final String label;
  final List<ContextMenuEntry> children;
  final Widget? leading;

  const ZenitNestedContextMenuItem({
    required this.label,
    required this.children,
    this.leading,
  });
}

class ZenitContextMenuDivider extends ContextMenuEntry {
  const ZenitContextMenuDivider();
}
