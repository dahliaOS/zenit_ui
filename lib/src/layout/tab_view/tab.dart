import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitTab extends StatelessWidget {
  const ZenitTab({
    super.key,
    this.title = "Tab",
    this.selected = true,
    this.icon = const FlutterLogo(
      size: 16,
    ),
    this.closeIcon,
    this.onClose,
    this.onPressed,
  });

  final String title;
  final Widget? icon;

  final IconData? closeIcon;

  final VoidCallback? onClose;
  final VoidCallback? onPressed;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTertiaryTapUp: (_) => onClose?.call(),
        child: Tooltip(
          message: title,
          child: ListTile(
            titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(overflow: TextOverflow.ellipsis),
            onTap: onPressed,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            selected: selected,
            selectedColor: Theme.of(context).colorScheme.onSurface,
            selectedTileColor: Theme.of(context).colorScheme.surface,
            title: Text(
              title,
            ),
            leading: SizedBox.square(dimension: 20, child: icon),
            minLeadingWidth: 20,
            trailing: ZenitIconButton(
              iconSize: 16,
              buttonSize: 24,
              onPressed: onClose,
              icon: Icons.close,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: kDefaultBorderRadiusMedium,
              side: selected
                  ? BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    )
                  : BorderSide.none,
            ),
            //TODO maybe find a better way because this is hacky af and very wrong
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
          ),
        ),
      ),
    );
  }
}
