import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/button_base.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitTextButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;

  const ZenitTextButton({super.key, this.child, this.onPressed, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? zenitTheme.primaryColor,
      hoverColor: (foregroundColor ?? zenitTheme.primaryColor).withOpacity(0.25),
      splashColor: (foregroundColor ?? zenitTheme.primaryColor).withOpacity(0.25),
      backgroundColor: Colors.transparent,
      child: child,
    );
  }
}

class ZenitFilledButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;

  const ZenitFilledButton({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? zenitTheme.foregroundColor,
      backgroundColor: backgroundColor ?? zenitTheme.surfaceColor,
      hoverColor: Color.alphaBlend(
        zenitTheme.foregroundColor.withOpacity(0.1),
        backgroundColor ?? zenitTheme.surfaceColor,
      ),
      child: child,
    );
  }
}

class ZenitElevatedButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;

  const ZenitElevatedButton({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? zenitTheme.foregroundColor,
      backgroundColor: backgroundColor ?? zenitTheme.primaryColor,
      child: child,
    );
  }
}

class ZenitButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? hoverColor;

  const ZenitButton({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? zenitTheme.foregroundColor,
      backgroundColor: backgroundColor ?? zenitTheme.surfaceColor,
      hoverColor: hoverColor,
      child: child,
    );
  }
}
