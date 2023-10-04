import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
  });

  final Widget? child;

  final VoidCallback? onPressed;

  // Use the debug color until a theme system is established
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? hoverColor;
  final Color? splashColor;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;

  @override
  _ButtonBaseState createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MergeSemantics(
      child: Semantics(
        button: true,
        container: true,
        enabled: widget.onPressed != null,
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: widget.backgroundColor ?? theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? kDefaultBorderRadiusMedium,
            side: widget.borderSide ?? BorderSide.none,
          ),
          child: InkWell(
            hoverColor: widget.hoverColor,
            splashColor: widget.splashColor,
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: IconTheme.merge(
                data: IconThemeData(
                  color: widget.foregroundColor ?? theme.colorScheme.onSurface,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: widget.foregroundColor ?? theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25,
                  ),
                  child: Center(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: widget.child ?? const Text("Button"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
