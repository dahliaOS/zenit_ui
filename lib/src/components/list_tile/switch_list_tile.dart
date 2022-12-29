import 'package:flutter/material.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitSwitchListTile extends StatelessWidget {
  const ZenitSwitchListTile({
    super.key,
    required this.value,
    this.onChanged,
    /* this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor, */
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

  final bool value;

  final ValueChanged<bool>? onChanged;

  //final Color? activeColor;

  //final Color? activeTrackColor;

  //final Color? inactiveThumbColor;

  //final Color? inactiveTrackColor;

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: ZenitSwitch(
        value: value,
        onChanged: onChanged,
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
      onTap: onChanged != null ? () => onChanged!(!value) : null,
    );
  }
}
