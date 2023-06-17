import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitRadioButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ZenitRadioButtonTheme? theme;
  //TODO implement groupValue
  const ZenitRadioButton({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? ZenitTheme.radioButtonTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final activeThumbColor = theme.activeThumbColor;
    final inactiveThumbColor = theme.inactiveThumbColor;
    return TickAnimator(
      onPressed: () => onChanged?.call(!value),
      borderRadius: BorderRadius.circular(24),
      child: PhysicalModel(
        borderRadius: kDefaultBorderRadiusBig,
        clipBehavior: Clip.antiAlias,
        color: value ? activeBackgroundColor : inactiveBackgroundColor,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: value ? activeThumbColor : inactiveThumbColor,
                borderRadius: kDefaultBorderRadiusBig,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
