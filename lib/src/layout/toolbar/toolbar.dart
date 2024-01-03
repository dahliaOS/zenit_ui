import 'package:flutter/material.dart';
import 'package:zenit_ui/src/extensions/extensions.dart';

class ZenitToolbar extends StatelessWidget implements PreferredSizeWidget {
  const ZenitToolbar({
    super.key,
    this.leadingActions,
    this.trailingActions,
    this.title,
    this.titleStyle = const TextStyle(),
    this.backgroundColor,
    this.centerTitle = true,
    this.border,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 6),
  });

  final List<Widget>? leadingActions;
  final List<Widget>? trailingActions;
  final Widget? title;
  final TextStyle titleStyle;
  final Color? backgroundColor;
  final Border? border;
  final bool centerTitle;
  final double? height;
  final EdgeInsetsGeometry padding;

  @override
  Size get preferredSize => Size.fromHeight(height ?? 48);

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ?? Theme.of(context).colorScheme.background.themedLightness(context, 0.05);
    return SizedBox(
      height: preferredSize.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          border: border,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: padding.horizontal / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: leadingActions ?? [],
                ),
              ),
            ),
            Align(
              alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600) ??
                    titleStyle,
                child: Padding(
                  padding: centerTitle ? EdgeInsets.zero : const EdgeInsets.only(left: 16.0),
                  child: title,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: padding.horizontal / 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: trailingActions ?? [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
