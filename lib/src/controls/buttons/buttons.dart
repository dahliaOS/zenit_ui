import 'package:zenit_ui/src/components/button_base.dart';
import 'package:zenit_ui/src/types/button_type.dart';
import 'package:zenit_ui/zenit_ui.dart';

class PrimaryButton extends ButtonBase {
  const PrimaryButton({
    Key? key,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Widget? child,
    bool? debugDarkMode,
  }) : super(
          key: key,
          type: ButtonType.primary,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          debugDarkMode: debugDarkMode,
          child: child,
        );
}

class SecondaryButton extends ButtonBase {
  const SecondaryButton({
    Key? key,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Widget? child,
    bool? debugDarkMode,
  }) : super(
          key: key,
          type: ButtonType.secondary,
          onPressed: onPressed,
          foregroundColor: foregroundColor,
          debugDarkMode: debugDarkMode,
          child: child,
        );
}
