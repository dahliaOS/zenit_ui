import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/button_base.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitPrimaryButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;

  const ZenitPrimaryButton({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.accentForegroundColor,
      backgroundColor: backgroundColor ?? theme.primaryColor,
      hoverColor: (backgroundColor ?? theme.foregroundColor).withOpacity(0.05),
      child: child,
    );
  }
}

class ZenitSecondaryButton extends StatelessWidget {
  final Widget? child;

  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;

  const ZenitSecondaryButton({
    super.key,
    this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.foregroundColor,
      backgroundColor: backgroundColor ?? theme.surfaceColor,
      hoverColor: (backgroundColor ?? theme.foregroundColor).withOpacity(0.05),
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
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.foregroundColor,
      backgroundColor: backgroundColor ?? theme.surfaceColor,
      hoverColor: hoverColor,
      child: child,
    );
  }
}
