import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ZenitCheckboxTheme? theme;
  //TODO implement groupValue
  const ZenitCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? ZenitTheme.checkboxTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final foregroundColor = theme.foregroundColor;
    return TickAnimator(
      onPressed: () => onChanged?.call(!value),
      borderRadius: kDefaultBorderRadiusMedium,
      child: PhysicalModel(
        borderRadius: kDefaultBorderRadiusMedium,
        clipBehavior: Clip.antiAlias,
        color: value ? activeBackgroundColor : inactiveBackgroundColor,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconTheme(
              data: IconThemeData(color: foregroundColor, size: 20),
              child: value ? const Icon(Icons.check_rounded) : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
