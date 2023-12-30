import 'package:zenit_ui/zenit_ui.dart';

class ZenitDialog extends AlertDialog {
  const ZenitDialog({
    super.key,
    super.icon,
    super.iconPadding,
    super.iconColor,
    super.title,
    super.titlePadding,
    super.titleTextStyle,
    super.content,
    super.contentPadding,
    super.contentTextStyle,
    super.actions,
    super.actionsPadding,
    super.actionsAlignment,
    super.actionsOverflowAlignment,
    super.actionsOverflowDirection,
    super.actionsOverflowButtonSpacing,
    super.buttonPadding,
    super.backgroundColor,
    super.elevation,
    super.shadowColor,
    super.surfaceTintColor,
    super.semanticLabel,
    super.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    super.clipBehavior = Clip.antiAlias,
    super.shape,
    super.alignment,
    super.scrollable = false,
  });

  @override
  Widget? get title => _ZenitDialogToolbar(
        title: super.title,
        padding: super.titlePadding ?? const EdgeInsets.symmetric(horizontal: 6),
        leadingActions: super.icon != null
            ? [
                Padding(
                  padding: super.iconPadding ?? const EdgeInsets.all(6),
                  child: super.icon,
                ),
              ]
            : [],
      );

  @override
  EdgeInsetsGeometry? get titlePadding => EdgeInsets.zero;

  @override
  double? get elevation => 0;

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.all(28);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: super.actions,
      actionsAlignment: super.actionsAlignment,
      actionsOverflowAlignment: super.actionsOverflowAlignment,
      actionsOverflowButtonSpacing: super.actionsOverflowButtonSpacing,
      actionsOverflowDirection: super.actionsOverflowDirection,
      actionsPadding: super.actionsPadding,
      alignment: super.alignment,
      backgroundColor: super.backgroundColor,
      buttonPadding: super.buttonPadding,
      clipBehavior: super.clipBehavior,
      content: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium ?? const TextStyle(),
        child: super.content ?? const SizedBox.shrink(),
      ),
      contentPadding: contentPadding,
      contentTextStyle: super.contentTextStyle,
      elevation: elevation,
      insetPadding: super.insetPadding,
      semanticLabel: super.semanticLabel,
      scrollable: super.scrollable,
      shadowColor: super.shadowColor,
      shape: super.shape ??
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
      surfaceTintColor: super.surfaceTintColor,
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: super.titleTextStyle,
      iconColor: super.iconColor,
      iconPadding: super.iconPadding,
    );
  }
}

class _ZenitDialogToolbar extends ZenitToolbar {
  const _ZenitDialogToolbar({
    super.title,
    super.leadingActions,
    super.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ZenitToolbar(
      backgroundColor: Colors.transparent,
      title: super.title,
      titleStyle: super.titleStyle,
      centerTitle: super.centerTitle,
      height: super.height,
      leadingActions: super.leadingActions,
      padding: super.padding,
      trailingActions: [
        if (Navigator.canPop(context))
          ZenitIconButton(
            icon: Icons.close,
            onPressed: () => Navigator.pop(context),
            buttonSize: 32,
            iconSize: 16,
          ),
      ],
    );
  }
}
