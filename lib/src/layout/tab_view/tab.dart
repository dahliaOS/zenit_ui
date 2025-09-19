import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitTab extends StatelessWidget {
  const ZenitTab({
    super.key,
    this.title = "Tab",
    this.tooltip = "",
    this.selected = true,
    this.icon = const FlutterLogo(
      size: 16,
    ),
    this.closeIcon,
    this.onClose,
    this.onPressed,
  });

  final String title;
  final String tooltip;
  final Widget? icon;

  final IconData? closeIcon;

  final VoidCallback? onClose;
  final VoidCallback? onPressed;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTertiaryTapUp: (_) => onClose?.call(),
        child: Tooltip(
          message: tooltip,
          child: Material(
            color: selected ? Theme.of(context).colorScheme.surface : Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: kDefaultBorderRadiusMedium,
              side: selected ? BorderSide(color: Theme.of(context).colorScheme.outline) : BorderSide.none,
            ),
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SizedBox.square(dimension: 20, child: icon),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (onClose != null)
                      ZenitIconButton(
                        iconSize: 16,
                        buttonSize: 24,
                        onPressed: onClose,
                        icon: closeIcon ?? Icons.close,
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
