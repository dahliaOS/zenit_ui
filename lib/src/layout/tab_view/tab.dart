import 'package:zenit_ui/src/base/action_base.dart';
import 'package:zenit_ui/zenit_ui.dart';

class Tab extends StatelessWidget {
  const Tab({
    super.key,
    this.title,
    this.enabled = true,
    //this.subtitle,
    this.icon = const FlutterLogo(
      size: 16,
    ),
    this.closeIcon,
    this.onClose,
    this.onPressed,
  });

  final String? title;
  //final Widget? subtitle;
  final Widget? icon;

  final IconData? closeIcon;

  final VoidCallback? onClose;
  final VoidCallback? onPressed;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ActionBase(
      onTapDown: onPressed,
      onTertiaryTapDown: (details) => onClose?.call(),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: 36,
        width: 184,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: enabled ? Theme.of(context).surfaceColor : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 8, 4),
                    child: icon,
                  ),
                Text(
                  title ?? "Tab",
                  style: TextStyle(color: Theme.of(context).foregroundColor),
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onClose,
                  icon: Icon(
                    closeIcon ?? Icons.close,
                    size: 14,
                    color: Theme.of(context).foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
