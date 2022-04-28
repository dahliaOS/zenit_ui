import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenit_ui/src/components/action_base.dart';
import 'package:zenit_ui/src/debug/constants.dart';
import 'package:zenit_ui/src/types/button_type.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    Key? key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.enabled,
    this.debugDarkMode,
    required this.type,
  }) : super(key: key);

  final Widget? child;

  final VoidCallback? onPressed;

  // Use the debug color until a theme system is established
  final Color? backgroundColor;
  final Color? foregroundColor;

  final ButtonType type;

  final bool? enabled;
  final bool? debugDarkMode;

  @override
  _ButtonBaseState createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  late Color _backgroundColor;
  late Color _buttonColor;
  late Color _flatButtonColor;
  late Color _disabledTextColor;
  late bool _enabled;
  late bool _debugDarkMode;
  @override
  void initState() {
    _enabled = widget.enabled ?? true;
    _debugDarkMode = widget.debugDarkMode ?? false;
    _flatButtonColor =
        _debugDarkMode ? const Color(0xff262626) : const Color(0xffE5E5E5);

    if (_enabled) {
      _backgroundColor = widget.backgroundColor ?? const Color(0xFF009966);
    } else {
      _backgroundColor = _flatButtonColor;
    }

    _disabledTextColor = _debugDarkMode
        ? Color.alphaBlend(const Color(0x75212121), const Color(0x75fafafa))
        : Color.alphaBlend(const Color(0x75fafafa), const Color(0x75212121));
    _buttonColor = _backgroundColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActionBase(
      onPressed: () async {
        if (_enabled) {
          setState(() => _buttonColor =
                Color.alphaBlend(Constants.focusMixinColor, _backgroundColor),
          );
          widget.onPressed?.call();
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() => _buttonColor =
                Color.alphaBlend(Constants.hoverMixinColor, _backgroundColor),
          );
        }
      },
      cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        if (_enabled) {
          setState(() {
            _buttonColor =
                Color.alphaBlend(Constants.hoverMixinColor, _backgroundColor);
          });
        }
      },
      onExit: (_) {
        if (_enabled) {
          setState(() {
            _buttonColor = _backgroundColor;
          });
        }
      },
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8),
        color: _buttonColor,
        child: Padding(
          padding: widget.child != null
              ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0)
              : EdgeInsets.zero,
          child: IconTheme.merge(
            data: IconThemeData(
              color: widget.foregroundColor,
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                color: _enabled ? widget.foregroundColor : _disabledTextColor,
                fontFamily: GoogleFonts.manrope().fontFamily,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
                backgroundColor: Constants.transparent,
              ),
              child: widget.child ?? const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
