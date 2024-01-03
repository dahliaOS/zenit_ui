import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/button_base.dart';
import 'package:zenit_ui/src/extensions/extensions.dart';

class ZenitPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;

  final BorderSide? borderSide;

  final BorderRadius? borderRadius;

  final Widget? child;

  const ZenitPrimaryButton({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      hoverColor: (backgroundColor ?? theme.colorScheme.onPrimary).withOpacity(0.1),
      splashColor: (backgroundColor ?? theme.colorScheme.onPrimary).withOpacity(0.1),
      borderSide: borderSide ?? BorderSide(color: theme.colorScheme.outline),
      borderRadius: borderRadius,
      child: child,
    );
  }
}

class ZenitSecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;

  final BorderSide? borderSide;

  final BorderRadius? borderRadius;

  final Widget? child;

  const ZenitSecondaryButton({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      hoverColor: (backgroundColor ?? theme.colorScheme.onSurface).withOpacity(0.1),
      splashColor: (backgroundColor ?? theme.colorScheme.onSurface).withOpacity(0.1),
      borderSide: borderSide ?? BorderSide(color: theme.colorScheme.outline),
      borderRadius: borderRadius,
      child: child,
    );
  }
}

class ZenitTextButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;

  final BorderSide? borderSide;

  final BorderRadius? borderRadius;

  final Widget? child;

  const ZenitTextButton({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ButtonBase(
      onPressed: onPressed,
      foregroundColor: foregroundColor ?? theme.colorScheme.primary,
      backgroundColor: backgroundColor ?? Colors.transparent,
      hoverColor: (backgroundColor ?? theme.colorScheme.primary).withOpacity(0.1),
      splashColor: (backgroundColor ?? theme.colorScheme.onPrimary).withOpacity(0.1),
      borderSide: borderSide ?? BorderSide(color: theme.colorScheme.primary.withOpacity(0.25)),
      borderRadius: borderRadius,
      fontWeight: FontWeight.w600,
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
  final Color? splashColor;

  final BorderSide? borderSide;

  final BorderRadius? borderRadius;

  final ButtonType type;

  const ZenitButton({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  }) : type = ButtonType.secondary;

  const ZenitButton.primary({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  }) : type = ButtonType.primary;

  const ZenitButton.secondary({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  }) : type = ButtonType.primary;

  const ZenitButton.text({
    super.key,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.hoverColor,
    this.splashColor,
    this.borderSide,
    this.borderRadius,
    this.child,
  }) : type = ButtonType.text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (type) {
      case ButtonType.primary:
        return ZenitPrimaryButton(
          onPressed: onPressed,
          foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          splashColor: splashColor,
          hoverColor: hoverColor,
          borderSide: borderSide,
          borderRadius: borderRadius,
          child: child,
        );
      case ButtonType.secondary:
        return ZenitSecondaryButton(
          onPressed: onPressed,
          foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
          backgroundColor: backgroundColor ?? theme.colorScheme.surface,
          splashColor: splashColor,
          hoverColor: hoverColor,
          borderSide: borderSide,
          borderRadius: borderRadius,
          child: child,
        );
      case ButtonType.text:
        return ZenitTextButton(
          onPressed: onPressed,
          foregroundColor: foregroundColor ??
              HSLColor.fromColor(theme.colorScheme.primary.themedLightness(context, 0.5))
                  .withSaturation(1)
                  .toColor(),
          backgroundColor: backgroundColor ?? theme.primaryColor.withOpacity(0.3),
          splashColor: splashColor,
          hoverColor: hoverColor,
          borderSide: borderSide,
          borderRadius: borderRadius,
          child: child,
        );
    }
  }
}

enum ButtonType {
  primary,
  secondary,
  text,
}
