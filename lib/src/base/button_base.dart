import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ButtonBase extends StatefulWidget {
  const ButtonBase({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
  });

  final Widget? child;

  final VoidCallback? onPressed;

  // Use the debug color until a theme system is established
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? hoverColor;
  final Color? splashColor;

  @override
  _ButtonBaseState createState() => _ButtonBaseState();
}

class _ButtonBaseState extends State<ButtonBase> {
  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return MergeSemantics(
      child: Semantics(
        button: true,
        container: true,
        enabled: widget.onPressed != null,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: kDefaultBorderRadiusMedium,
          color: widget.backgroundColor ?? zenitTheme.surfaceColor,
          elevation: kDefaultElevation,
          child: InkWell(
            hoverColor: widget.hoverColor,
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: IconTheme.merge(
                data: IconThemeData(
                  color: widget.foregroundColor ?? zenitTheme.foregroundColor,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: widget.foregroundColor ?? zenitTheme.foregroundColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
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
