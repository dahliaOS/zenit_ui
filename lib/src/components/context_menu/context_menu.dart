import 'package:flutter/material.dart';
import 'package:zenit_ui/src/components/context_menu/context_menu_item.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitContextMenuData {
  final List<ContextMenuEntry> entries;

  const ZenitContextMenuData({required this.entries});
}

class ZenitContextMenuBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    MenuController controller,
    Widget? child,
  ) builder;
  final ZenitContextMenuData contextMenu;
  final MenuStyle? menuStyle;
  final ButtonStyle? menuItemStyle;
  final ButtonStyle? nestedMenuItemStyle;
  final Widget? child;

  const ZenitContextMenuBuilder({
    required this.builder,
    required this.contextMenu,
    this.menuStyle,
    this.menuItemStyle,
    this.nestedMenuItemStyle,
    this.child,
    super.key,
  });

  @override
  State<ZenitContextMenuBuilder> createState() => _ZenitContextMenuBuilderState();
}

class _ZenitContextMenuBuilderState extends State<ZenitContextMenuBuilder> {
  ShortcutRegistryEntry? shortcutRegistryEntry;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final shortcuts = _buildShortcuts(widget.contextMenu.entries);

    if (shortcutRegistryEntry == null) {
      shortcutRegistryEntry = ShortcutRegistry.of(context).addAll(shortcuts);
    } else {
      shortcutRegistryEntry!.replaceAll(shortcuts);
    }
  }

  @override
  void didUpdateWidget(covariant ZenitContextMenuBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    shortcutRegistryEntry?.dispose();
    shortcutRegistryEntry = null;
    super.dispose();
  }

  Widget _buildItem(ContextMenuEntry item) {
    return switch (item) {
      final ZenitContextMenuItem item => MenuItemButton(
          shortcut: item.shortcut,
          leadingIcon: item.leading,
          trailingIcon: item.trailing,
          style: widget.menuItemStyle ?? _menuItemStyle,
          onPressed: item.onPressed,
          child: Text(item.label),
        ),
      final ZenitNestedContextMenuItem nested => SubmenuButton(
          leadingIcon: nested.leading,
          menuChildren: nested.children.map(_buildItem).toList(),
          alignmentOffset: const Offset(12, 0),
          style: widget.nestedMenuItemStyle ?? _menuItemStyle,
          menuStyle: widget.menuStyle ?? _menuStyle(context),
          child: Text(nested.label),
        ),
      ZenitContextMenuDivider() => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            thickness: 1,
            endIndent: 8,
            indent: 8,
          ),
        ),
    };
  }

  Map<MenuSerializableShortcut, Intent> _buildShortcuts(
    List<ContextMenuEntry> entries,
  ) {
    final result = <MenuSerializableShortcut, Intent>{};
    result.clear();

    for (final selection in entries) {
      if (selection case ZenitNestedContextMenuItem()) {
        result.addAll(_buildShortcuts(selection.children));
      } else if (selection case ZenitContextMenuItem()) {
        if (selection.shortcut != null && selection.onPressed != null) {
          result[selection.shortcut!] = VoidCallbackIntent(selection.onPressed!);
        }
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      menuChildren: widget.contextMenu.entries.map(_buildItem).toList(),
      style: widget.menuStyle ?? _menuStyle(context),
      alignmentOffset: const Offset(4, 4),
      builder: widget.builder,
      child: widget.child,
    );
  }
}

const _menuItemStyle = ButtonStyle(
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: kDefaultBorderRadiusMedium,
    ),
  ),
  iconSize: MaterialStatePropertyAll(16),
  elevation: MaterialStatePropertyAll(0),
  visualDensity: VisualDensity(horizontal: -2, vertical: -3),
);

MenuStyle _menuStyle(BuildContext context) {
  return MenuStyle(
    surfaceTintColor: MaterialStatePropertyAll(
      Theme.of(context).colorScheme.surface,
    ),
    backgroundColor: MaterialStatePropertyAll(
      Theme.of(context).colorScheme.surface,
    ),
    padding: const MaterialStatePropertyAll(EdgeInsets.all(6)),
    shape: const MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadiusLarge,
      ),
    ),
    side: MaterialStatePropertyAll(
      BorderSide(
        color: Theme.of(context).colorScheme.outline,
      ),
    ),
    elevation: const MaterialStatePropertyAll(0),
    visualDensity: VisualDensity.standard,
  );
}
