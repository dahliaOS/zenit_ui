import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/types/button_type.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.debugDarkMode,
    required this.type,
  });

  final Widget? child;

  final VoidCallback? onPressed;

  // Use the debug color until a theme system is established
  final Color? backgroundColor;
  final Color? foregroundColor;

  final ButtonType type;

  final bool? debugDarkMode;

  @override
  _ButtonBaseState createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  late bool _enabled;

  late Color backgroundColor;
  late Color textColor;

  late Color buttonColor;

  late Color focusMixin;
  late Color hoverMixin;

  void loadColors() {
    _enabled = widget.onPressed != null;
    textColor =
        widget.foregroundColor ?? ZenitTheme.of(context).foregroundColor;
    focusMixin = MaterialTheme.of(context).focusColor;
    hoverMixin = MaterialTheme.of(context).hoverColor;

    if (!_enabled) {
      backgroundColor = const Color(0xFFE5E5E5);
      textColor = const Color(0xFF212121).withOpacity(0.25);
    } else if (widget.type == ButtonType.primary) {
      backgroundColor =
          widget.backgroundColor ?? ZenitTheme.of(context).primaryColor;
    } else {
      backgroundColor = ZenitTheme.of(context).backgroundColor;
    }

    buttonColor = backgroundColor;
  }

  @override
  void didChangeDependencies() {
    loadColors();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ButtonBase oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadColors();
  }

  @override
  Widget build(BuildContext context) {
    return TickAnimator(
      multiplier: 0.9,
      borderRadius: kDefaultBorderRadiusBig,
      onPressed: () async {
        if (_enabled) {
          setState(
            () => buttonColor = Color.alphaBlend(focusMixin, backgroundColor),
          );
          widget.onPressed?.call();
          await Future.delayed(const Duration(milliseconds: 100));
          setState(
            () => buttonColor = Color.alphaBlend(
              hoverMixin,
              backgroundColor,
            ),
          );
        }
      },
      child: MouseRegion(
        cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) {
          if (_enabled) {
            setState(() {
              buttonColor = Color.alphaBlend(hoverMixin, backgroundColor);
            });
          }
        },
        onExit: (_) {
          if (_enabled) {
            setState(() {
              buttonColor = backgroundColor;
            });
          }
        },
        child: PhysicalModel(
          borderRadius: kDefaultBorderRadiusBig,
          color: buttonColor,
          clipBehavior: Clip.antiAlias,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: kDefaultBorderRadiusBig,
              border: Border.all(
                color: ZenitTheme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: widget.child != null
                  ? const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0)
                  : EdgeInsets.zero,
              child: IconTheme.merge(
                data: IconThemeData(
                  color: widget.foregroundColor,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: textColor,
                    fontFamily: GoogleFonts.manrope().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.8,
                    backgroundColor: Colors.transparent,
                  ),
                  child: widget.child ?? const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
