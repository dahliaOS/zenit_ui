import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitTab extends StatelessWidget {
  const ZenitTab({
    super.key,
    this.title = "Tab",
    this.selected = true,
    this.icon = const FlutterLogo(
      size: 16,
    ),
    this.closeIcon,
    this.onClose,
    this.onPressed,
  });

  final String title;
  final Widget? icon;

  final IconData? closeIcon;

  final VoidCallback? onClose;
  final VoidCallback? onPressed;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    // Colors
    final backgroundColor = selected ? Theme.of(context).colorScheme.surface : Colors.transparent;
    final borderColor =
        selected ? Theme.of(context).foregroundColor.withOpacity(0.15) : Theme.of(context).colorScheme.surface;

    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: onPressed,
        onTertiaryTapUp: (_) => onClose?.call(),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(
            message: title,
            child: Material(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: kDefaultBorderRadiusMedium,
                side: BorderSide(color: borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    if (icon != null) SizedBox.square(dimension: 20, child: icon),
                    const SizedBox.square(dimension: 8),
                    SizedBox(
                      width: 132,
                      child: Text(
                        title,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const Spacer(),
                    if (onClose != null)
                      IconButton(
                        iconSize: 16,
                        constraints: const BoxConstraints.tightFor(width: 24, height: 24),
                        color: Theme.of(context).foregroundColor,
                        padding: EdgeInsets.zero,
                        onPressed: onClose,
                        icon: const Icon(
                          Icons.close,
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
