import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final ZenitCheckboxTheme? theme;
  final Color? activeColor;
  final Color? checkColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool tristate;
  //TODO implement groupValue
  const ZenitCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
    this.activeColor,
    this.checkColor,
    this.focusNode,
    this.autofocus = false,
    this.tristate = false,
  }) : assert(tristate || value != null);

  void handleTap() {
    if (onChanged == null) return;
    switch (value) {
      case false:
        onChanged!(true);
      case true:
        onChanged!(tristate ? null : false);
      case null:
        onChanged!(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? ZenitTheme.checkboxTheme(context);
    final activeBackgroundColor = activeColor ?? theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final foregroundColor = checkColor ?? theme.foregroundColor;
    final colored = value != false;
    return TickAnimator(
      onPressed: handleTap,
      borderRadius: kDefaultBorderRadiusMedium,
      child: Focus(
        focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus,
        child: PhysicalModel(
          borderRadius: kDefaultBorderRadiusMedium,
          clipBehavior: Clip.antiAlias,
          color: colored ? activeBackgroundColor : inactiveBackgroundColor,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconTheme(
                data: IconThemeData(color: foregroundColor, size: 20),
                child: switch (value) {
                  true => Icon(Icons.check_rounded, color: foregroundColor),
                  false => const SizedBox(),
                  null => Icon(Icons.remove_rounded, color: foregroundColor),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
