import 'package:zenit_ui/src/base/action_base.dart';
import 'package:zenit_ui/zenit_ui.dart';

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
    final theme = this.theme ?? ZenitTheme.of(context).radioButtonTheme;
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final activeThumbColor = theme.activeThumbColor;
    final inactiveThumbColor = theme.inactiveThumbColor;
    return ActionBase(
      onTapUp: () => onChanged?.call(!value),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(24),
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
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
