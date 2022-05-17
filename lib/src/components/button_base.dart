import 'package:google_fonts/google_fonts.dart';
import 'package:zenit_ui/src/components/action_base.dart';
import 'package:zenit_ui/src/types/button_type.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    Key? key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.debugDarkMode,
    required this.type,
  }) : super(key: key);

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

  void loadColors() {
    _enabled = widget.onPressed != null;

    if (!_enabled) {
      backgroundColor = const Color(0xFFE5E5E5);
      textColor = const Color(0xFFFFFFFF).withOpacity(0.75);
    } else if (!(widget.type == ButtonType.primary)) {
      backgroundColor = const Color(0xFFE5E5E5);
    } else {
      backgroundColor =
          widget.backgroundColor ?? Theme.of(context).primaryColor;
    }

    buttonColor = backgroundColor;
    textColor = widget.foregroundColor ?? const Color(0xFF000000);
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
    return ActionBase(
      onPressed: () async {
        if (_enabled) {
          setState(
            () => buttonColor =
                Color.alphaBlend(Constants.focusMixinColor, backgroundColor),
          );
          widget.onPressed?.call();
          await Future.delayed(const Duration(milliseconds: 100));
          setState(
            () => buttonColor = Color.alphaBlend(
              Constants.hoverMixinColor,
              backgroundColor,
            ),
          );
        }
      },
      cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        if (_enabled) {
          setState(() {
            buttonColor =
                Color.alphaBlend(Constants.hoverMixinColor, backgroundColor);
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
        borderRadius: BorderRadius.circular(8),
        color: buttonColor,
        clipBehavior: Clip.antiAlias,
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
