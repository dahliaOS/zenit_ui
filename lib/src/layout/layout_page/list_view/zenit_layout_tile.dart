import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitLayoutTile extends StatelessWidget {
  const ZenitLayoutTile({
    super.key,
    this.selected,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final bool? selected;

  final Widget? leading;

  final Widget? title;

  final Widget? subtitle;

  final Widget? trailing;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ZenitLayoutTileScope? scope = ZenitLayoutTileScope.maybeOf(context);
    final bool isSelected = selected ?? scope?.selected ?? false;
    return Material(
      clipBehavior: Clip.antiAlias,
      color: isSelected ? Theme.of(context).colorScheme.surface : Colors.transparent,
      borderRadius: kDefaultBorderRadiusMedium,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        dense: true,
        selected: isSelected,
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
              ),
          child: title!,
        ),
        iconColor: Theme.of(context).colorScheme.onSurface,
        selectedColor: Theme.of(context).colorScheme.onPrimary,
        selectedTileColor: Theme.of(context).colorScheme.primary,
        subtitle: subtitle,
        leading: SizedBox(width: 56, child: leading),
        trailing: trailing,
        onTap: () {
          scope?.onTap();
          onTap?.call();
        },
      ),
    );
  }
}

class ZenitLayoutTileScope extends InheritedWidget {
  const ZenitLayoutTileScope({
    super.key,
    required super.child,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;
  final VoidCallback onTap;

  static ZenitLayoutTileScope of(BuildContext context) {
    return maybeOf(context)!;
  }

  static ZenitLayoutTileScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ZenitLayoutTileScope>();
  }

  @override
  bool updateShouldNotify(ZenitLayoutTileScope oldWidget) {
    return selected != oldWidget.selected || index != oldWidget.index;
  }
}
