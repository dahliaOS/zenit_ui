import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitRadioButton<T> extends StatelessWidget {
  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final ZenitRadioButtonTheme? theme;
  const ZenitRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? ZenitTheme.radioButtonTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final activeThumbColor = theme.activeThumbColor;
    final inactiveThumbColor = theme.inactiveThumbColor;
    final selected = value == groupValue;
    return TickAnimator(
      onPressed: () => onChanged?.call(value),
      borderRadius: BorderRadius.circular(24),
      child: PhysicalModel(
        borderRadius: kDefaultBorderRadiusBig,
        clipBehavior: Clip.antiAlias,
        color: switch (selected) {
          true => activeBackgroundColor,
          false => inactiveBackgroundColor,
        },
        child: SizedBox(
          width: 24,
          height: 24,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: switch (selected) {
                  true => activeThumbColor,
                  false => inactiveThumbColor,
                },
                borderRadius: kDefaultBorderRadiusBig,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
