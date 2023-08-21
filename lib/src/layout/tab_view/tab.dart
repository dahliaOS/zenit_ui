import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/zenit_ui.dart';

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
    final backgroundColor = selected ? Theme.of(context).surfaceColor : Colors.transparent;

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
              shape: const RoundedRectangleBorder(
                borderRadius: kDefaultBorderRadiusMedium,
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
                      ZenitIconButton(
                        iconSize: 16,
                        buttonSize: 24,
                        onPressed: onClose,
                        icon: Icons.close,
                      ),
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
