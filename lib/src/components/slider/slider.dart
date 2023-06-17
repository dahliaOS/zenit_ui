import 'package:flutter/material.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double? height;

  final Color? activeColor;
  final bool autofocus;
  final int? divisions;
  final FocusNode? focusNode;
  final Color? inactiveColor;
  final String? label;
  final double max;
  final double min;
  final MouseCursor? mouseCursor;
  final ValueChanged<double>? onChangeEnd;
  final ValueChanged<double>? onChangeStart;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final Color? thumbColor;

  const ZenitSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.height = 8.0,
    this.activeColor,
    this.autofocus = false,
    this.divisions,
    this.focusNode,
    this.inactiveColor,
    this.label,
    this.max = 1.0,
    this.min = 0.0,
    this.mouseCursor,
    this.onChangeEnd,
    this.onChangeStart,
    this.semanticFormatterCallback,
    this.thumbColor,
  });

  @override
  Widget build(BuildContext context) {
    final ZenitSliderTheme sliderTheme = ZenitTheme.sliderTheme(context);
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: height,
        thumbShape: RoundSliderThumbShape(
          elevation: 0.0,
          enabledThumbRadius: height! * 1.5,
          disabledThumbRadius: height! * 1.5,
          pressedElevation: 0.0,
        ),
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? sliderTheme.activeTrackColor,
        autofocus: autofocus,
        divisions: divisions,
        focusNode: focusNode,
        inactiveColor: inactiveColor ?? sliderTheme.trackColor,
        key: key,
        label: label,
        max: max,
        min: min,
        mouseCursor: mouseCursor,
        onChangeEnd: onChangeEnd,
        onChangeStart: onChangeStart,
        semanticFormatterCallback: semanticFormatterCallback,
        thumbColor: thumbColor,
      ),
    );
  }
}
