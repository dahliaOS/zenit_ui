import 'package:flutter/material.dart';

class ZenitSwitchTheme extends ThemeExtension<ZenitSwitchTheme> {
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;
  final Color outlineColor;

  const ZenitSwitchTheme({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.disabledTrackColor,
    required this.disabledThumbColor,
    required this.outlineColor,
  });

  @override
  ZenitSwitchTheme copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    Color? disabledTrackColor,
    Color? disabledThumbColor,
    Color? outlineColor,
  }) {
    return ZenitSwitchTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeThumbColor: activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      disabledTrackColor: disabledTrackColor ?? this.disabledTrackColor,
      disabledThumbColor: disabledThumbColor ?? this.disabledThumbColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }

  @override
  ThemeExtension<ZenitSwitchTheme> lerp(covariant ThemeExtension<ZenitSwitchTheme>? other, double t) {
    if (other is! ZenitSwitchTheme) return this;
    return ZenitSwitchTheme(
      activeTrackColor: Color.lerp(activeTrackColor, other.activeTrackColor, t)!,
      inactiveTrackColor: Color.lerp(inactiveTrackColor, other.inactiveTrackColor, t)!,
      activeThumbColor: Color.lerp(activeThumbColor, other.activeThumbColor, t)!,
      inactiveThumbColor: Color.lerp(inactiveThumbColor, other.inactiveThumbColor, t)!,
      disabledTrackColor: Color.lerp(disabledTrackColor, other.disabledTrackColor, t)!,
      disabledThumbColor: Color.lerp(disabledThumbColor, other.disabledThumbColor, t)!,
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t)!,
    );
  }
}
