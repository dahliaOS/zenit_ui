import 'package:flutter/material.dart';

class ZenitCheckboxTheme extends ThemeExtension<ZenitCheckboxTheme> {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color outlineColor;

  const ZenitCheckboxTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
    required this.outlineColor,
  });

  @override
  ZenitCheckboxTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? outlineColor,
  }) {
    return ZenitCheckboxTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }

  @override
  ThemeExtension<ZenitCheckboxTheme> lerp(covariant ThemeExtension<ZenitCheckboxTheme>? other, double t) {
    if (other is! ZenitCheckboxTheme) return this;
    return ZenitCheckboxTheme(
      activeBackgroundColor: Color.lerp(activeBackgroundColor, other.activeBackgroundColor, t)!,
      inactiveBackgroundColor: Color.lerp(inactiveBackgroundColor, other.inactiveBackgroundColor, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t)!,
    );
  }
}
