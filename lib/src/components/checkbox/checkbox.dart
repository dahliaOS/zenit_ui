import 'package:zenit_ui/src/base/action_base.dart';
import 'package:zenit_ui/zenit_ui.dart';

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
    final theme = this.theme ?? ZenitTheme.of(context).checkboxTheme;
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final foregroundColor = theme.foregroundColor;
    return ActionBase(
      onTapUp: () => onChanged?.call(!value),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8),
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
