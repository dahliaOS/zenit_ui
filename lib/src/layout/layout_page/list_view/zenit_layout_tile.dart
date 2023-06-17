import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

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
      borderRadius: kDefaultBorderRadiusSmall,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        dense: true,
        selected: isSelected,
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).foregroundColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
          child: title!,
        ),
        iconColor: Theme.of(context).foregroundColor,
        selectedColor: Theme.of(context).primaryColor,
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
