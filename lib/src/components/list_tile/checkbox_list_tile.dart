import 'package:flutter/material.dart';
import 'package:zenit_ui/src/components/checkbox/checkbox.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitCheckboxListTile extends StatelessWidget {
  const ZenitCheckboxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.checkboxTheme,
    this.tileColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.title,
    this.subtitle,
    this.secondary,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.selected = false,
    this.autofocus = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.shape,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.enableFeedback,
    this.hoverColor,
  }) : assert(!isThreeLine || subtitle != null);

  final bool? value;

  final ValueChanged<bool?>? onChanged;

  final bool tristate;

  final ZenitCheckboxTheme? checkboxTheme;

  final Color? tileColor;

  final ImageProvider? activeThumbImage;

  final ImageProvider? inactiveThumbImage;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;

  final EdgeInsetsGeometry? contentPadding;

  final bool selected;

  final bool autofocus;

  final ListTileControlAffinity controlAffinity;

  final ShapeBorder? shape;

  final Color? selectedTileColor;

  final VisualDensity? visualDensity;

  final FocusNode? focusNode;

  final bool? enableFeedback;

  final Color? hoverColor;

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
    return ListTile(
      trailing: ZenitCheckbox(
        value: value,
        onChanged: onChanged,
        tristate: tristate,
        theme: checkboxTheme,
      ),
      title: title,
      subtitle: subtitle,
      leading: secondary,
      isThreeLine: isThreeLine,
      dense: dense,
      contentPadding: contentPadding,
      selected: selected,
      autofocus: autofocus,
      shape: shape,
      selectedTileColor: selectedTileColor,
      visualDensity: visualDensity,
      focusNode: focusNode,
      enableFeedback: enableFeedback,
      hoverColor: hoverColor,
      onTap: handleTap,
    );
  }
}
