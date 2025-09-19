import 'package:flutter/material.dart';

class ZenitSliderTheme extends ThemeExtension<ZenitSliderTheme> {
  final Color activeTrackColor;
  final Color trackColor;
  final Color outlineColor;
  final Color thumbColor;

  const ZenitSliderTheme({
    required this.activeTrackColor,
    required this.trackColor,
    required this.outlineColor,
    required this.thumbColor,
  });

  @override
  ZenitSliderTheme copyWith({
    Color? activeTrackColor,
    Color? trackColor,
    Color? outlineColor,
    Color? thumbColor,
  }) {
    return ZenitSliderTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      trackColor: trackColor ?? this.trackColor,
      outlineColor: outlineColor ?? this.outlineColor,
      thumbColor: thumbColor ?? this.thumbColor,
    );
  }

  @override
  ThemeExtension<ZenitSliderTheme> lerp(covariant ThemeExtension<ZenitSliderTheme>? other, double t) {
    if (other is! ZenitSliderTheme) return this;
    return ZenitSliderTheme(
      activeTrackColor: Color.lerp(activeTrackColor, other.activeTrackColor, t)!,
      trackColor: Color.lerp(trackColor, other.trackColor, t)!,
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t)!,
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t)!,
    );
  }
}
