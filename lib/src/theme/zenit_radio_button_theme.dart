import 'package:flutter/material.dart';

class ZenitRadioButtonTheme extends ThemeExtension<ZenitRadioButtonTheme> {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color disabledBackgroundColor;
  final Color thumbColor;
  final Color outlineColor;

  const ZenitRadioButtonTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.disabledBackgroundColor,
    required this.thumbColor,
    required this.outlineColor,
  });

  @override
  ZenitRadioButtonTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? disabledBackgroundColor,
    Color? thumbColor,
    Color? outlineColor,
  }) {
    return ZenitRadioButtonTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      thumbColor: thumbColor ?? this.thumbColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }

  @override
  ThemeExtension<ZenitRadioButtonTheme> lerp(covariant ThemeExtension<ZenitRadioButtonTheme>? other, double t) {
    if (other is! ZenitRadioButtonTheme) return this;
    return ZenitRadioButtonTheme(
      activeBackgroundColor: Color.lerp(activeBackgroundColor, other.activeBackgroundColor, t)!,
      inactiveBackgroundColor: Color.lerp(inactiveBackgroundColor, other.inactiveBackgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t)!,
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t)!,
    );
  }
}
