import 'package:flutter/widgets.dart';
import 'package:zenit_ui/src/components/action_base.dart';
import 'package:zenit_ui/src/debug/constants.dart';

class Chip extends StatefulWidget {
  const Chip({
    Key? key,
    this.label,
    this.enabled,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.leading,
    this.onPressed,
  }) : super(key: key);

  final String? label;

  final bool? enabled;

  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;

  final Widget? leading;

  final VoidCallback? onPressed;

  @override
  State<Chip> createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  late Color _chipColor;
  late bool _enabled;
  late Color _defaultColor;

  @override
  void initState() {
    _chipColor = widget.color ?? Constants.darkElelementColor;
    _enabled = widget.enabled ?? true;
    _defaultColor = widget.color ?? Constants.darkElelementColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActionBase(
      onPressed: () async {
        if (_enabled) {
          setState(() => _chipColor =
              Color.alphaBlend(Constants.focusMixinColor, _defaultColor));
          widget.onPressed?.call();
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() => _chipColor =
              Color.alphaBlend(Constants.hoverMixinColor, _defaultColor));
        }
      },
      child: MouseRegion(
        cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) {
          if (_enabled) {
            setState(() {
              _chipColor =
                  Color.alphaBlend(Constants.hoverMixinColor, _defaultColor);
            });
          }
        },
        onExit: (_) {
          if (_enabled) {
            setState(() {
              _chipColor = widget.color ?? Constants.darkElelementColor;
            });
          }
        },
        child: SizedBox(
          height: 32,
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(24),
            color: _chipColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.leading ?? const SizedBox.shrink(),
                  Text(
                    widget.label ?? "Chip with no label",
                    style: TextStyle(
                      fontSize: 14,
                      color: (widget.color != null)
                          ? (widget.color!.computeLuminance() < 0.4
                              ? Constants.lightTextColor
                              : Constants.darkTextColor)
                          : Constants.darkTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
