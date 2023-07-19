import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

export 'package:flutter/services.dart'
    show SmartDashesType, SmartQuotesType, TextCapitalization, TextInputAction, TextInputType;

class ZenitTextField extends StatelessWidget {
  const ZenitTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.decoration,
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    bool? enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
    this.hint,
  })  : assert(obscuringCharacter.length == 1),
        smartDashesType = smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(
          maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0,
        ),
        assert(
          !identical(textInputAction, TextInputAction.newline) ||
              maxLines == 1 ||
              !identical(keyboardType, TextInputType.text),
          'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.',
        ),
        keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        enableInteractiveSelection = enableInteractiveSelection ?? (!readOnly || !obscureText);

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final InputDecoration? decoration;

  final TextInputType keyboardType;

  final TextInputAction? textInputAction;

  final TextCapitalization textCapitalization;

  final TextStyle? style;

  final StrutStyle? strutStyle;

  final TextAlign textAlign;

  final TextAlignVertical? textAlignVertical;

  final TextDirection? textDirection;

  final bool autofocus;

  final String obscuringCharacter;

  final bool obscureText;

  final bool autocorrect;

  final SmartDashesType smartDashesType;

  final SmartQuotesType smartQuotesType;

  final bool enableSuggestions;

  final int? maxLines;

  final int? minLines;

  final bool expands;

  final bool readOnly;

  final bool? showCursor;

  static const int noMaxLength = -1;

  final int? maxLength;

  final MaxLengthEnforcement? maxLengthEnforcement;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onSubmitted;

  final AppPrivateCommandCallback? onAppPrivateCommand;

  final List<TextInputFormatter>? inputFormatters;

  final bool? enabled;

  final double cursorWidth;

  final double? cursorHeight;

  final Radius? cursorRadius;

  final Color? cursorColor;

  final ui.BoxHeightStyle selectionHeightStyle;

  final ui.BoxWidthStyle selectionWidthStyle;

  final Brightness? keyboardAppearance;

  final EdgeInsets scrollPadding;

  final bool enableInteractiveSelection;

  final TextSelectionControls? selectionControls;

  final DragStartBehavior dragStartBehavior;

  bool get selectionEnabled => enableInteractiveSelection;

  final GestureTapCallback? onTap;

  final MouseCursor? mouseCursor;

  final InputCounterWidgetBuilder? buildCounter;

  final ScrollPhysics? scrollPhysics;

  final ScrollController? scrollController;

  final Iterable<String>? autofillHints;

  final Clip clipBehavior;

  final String? restorationId;

  final bool scribbleEnabled;

  final bool enableIMEPersonalizedLearning;

  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final String? hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final kDefaultInputDecoration = zenitInputDecorationTheme(theme);

    return TextField(
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      autofocus: autofocus,
      buildCounter: buildCounter,
      clipBehavior: clipBehavior,
      controller: controller,
      cursorColor: cursorColor ?? theme.primaryColor,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorWidth: cursorWidth,
      decoration: decoration?.applyDefaults(kDefaultInputDecoration).copyWith(hintText: hint) ??
          const InputDecoration().applyDefaults(kDefaultInputDecoration).copyWith(hintText: hint),
      dragStartBehavior: dragStartBehavior,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      enableInteractiveSelection: enableInteractiveSelection,
      enableSuggestions: enableSuggestions,
      enabled: enabled,
      expands: expands,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      key: key,
      keyboardAppearance: keyboardAppearance,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      mouseCursor: mouseCursor,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      onAppPrivateCommand: onAppPrivateCommand,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTap: onTap,
      readOnly: readOnly,
      restorationId: restorationId,
      scribbleEnabled: scribbleEnabled,
      scrollController: scrollController,
      scrollPadding: scrollPadding,
      scrollPhysics: scrollPhysics,
      selectionControls: selectionControls,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      showCursor: showCursor,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      strutStyle: strutStyle,
      style: const TextStyle(fontSize: 15).merge(style),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      textInputAction: textInputAction,
      contextMenuBuilder: contextMenuBuilder,
    );
  }
}

const double _kDefaultBorderWidth = 2.0;

const BorderSide _kDefaultBorderSideInactive = BorderSide(
  color: Colors.transparent,
  width: _kDefaultBorderWidth,
);

const OutlineInputBorder _kDefaultOutlineInputBorderInactive = OutlineInputBorder(
  borderSide: _kDefaultBorderSideInactive,
  borderRadius: kDefaultBorderRadiusMedium,
);

InputDecorationTheme zenitInputDecorationTheme(ThemeData theme) {
  final BorderSide kDefaultBorderSideActive = BorderSide(
    color: theme.primaryColor,
    width: _kDefaultBorderWidth,
  );

  final kDefaultInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: theme.elementColor,
    border: _kDefaultOutlineInputBorderInactive,
    enabledBorder: _kDefaultOutlineInputBorderInactive,
    disabledBorder: _kDefaultOutlineInputBorderInactive,
    focusedBorder: OutlineInputBorder(
      borderSide: kDefaultBorderSideActive,
      borderRadius: kDefaultBorderRadiusMedium,
    ),
    labelStyle: TextStyle(color: theme.foregroundColor.withOpacity(0.75)),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  );

  return kDefaultInputDecorationTheme;
}
