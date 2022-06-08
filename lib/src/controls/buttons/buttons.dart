import 'package:zenit_ui/src/components/button_base.dart';
import 'package:zenit_ui/src/types/button_type.dart';
import 'package:zenit_ui/zenit_ui.dart';

class PrimaryButton extends ButtonBase {
  const PrimaryButton({
    super.key,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Widget? child,
  }) : super(
          type: ButtonType.primary,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          child: child,
        );
}

class SecondaryButton extends ButtonBase {
  const SecondaryButton({
    super.key,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Widget? child,
  }) : super(
          type: ButtonType.secondary,
          onPressed: onPressed,
          foregroundColor: foregroundColor,
          child: child,
        );
}

class Button extends ButtonBase {
  const Button.primary({
    super.key,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Widget? child,
  }) : super(
          type: ButtonType.primary,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          child: child,
        );

  const Button.secondary({
    super.key,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Widget? child,
  }) : super(
          type: ButtonType.secondary,
          onPressed: onPressed,
          foregroundColor: foregroundColor,
          child: child,
        );
}
