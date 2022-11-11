import 'package:zenit_ui/src/base/button_base.dart';
import 'package:zenit_ui/src/types/button_type.dart';

class PrimaryButton extends ButtonBase {
  const PrimaryButton({
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.child,
  }) : super(
          type: ButtonType.primary,
        );
}

class SecondaryButton extends ButtonBase {
  const SecondaryButton({
    super.key,
    super.onPressed,
    super.foregroundColor,
    super.child,
  }) : super(
          type: ButtonType.secondary,
        );
}

class Button extends ButtonBase {
  const Button.primary({
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.child,
  }) : super(
          type: ButtonType.primary,
        );

  const Button.secondary({
    super.key,
    super.onPressed,
    super.foregroundColor,
    super.child,
  }) : super(
          type: ButtonType.secondary,
        );
}
