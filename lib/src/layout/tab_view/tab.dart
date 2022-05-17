import 'package:flutter/material.dart'
    show FlutterLogo, IconButton, Icons;
import 'package:zenit_ui/src/components/action_base.dart';
import 'package:zenit_ui/zenit_ui.dart';

class Tab extends StatelessWidget {
  const Tab({
    Key? key,
    this.title,
    this.enabled = true,
    //this.subtitle,
    this.icon = const FlutterLogo(
      size: 16,
    ),
    this.closeIcon,
    this.onClose,
  }) : super(key: key);

  final Widget? title;
  //final Widget? subtitle;
  final Widget? icon;

  final IconData? closeIcon;

  final VoidCallback? onClose;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ActionBase(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: 40,
        width: 184,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: enabled ? Constants.darkSurfaceColor : Constants.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                    child: icon!,
                  ),
                /* Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title ??
                        Text(
                          "Tab",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                    subtitle ?? const SizedBox()
                  ],
                ), */
                Text(
                  "Tab",
                  style: Theme.of(context).materialTheme.textTheme.subtitle2,
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onClose,
                  icon: Icon(
                    closeIcon ?? Icons.close,
                    size: 16,
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
