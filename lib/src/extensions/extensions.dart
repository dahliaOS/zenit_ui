import 'package:flutter/material.dart';

extension ObX on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension ColorX on Color {
  Color mix(Color foregrounnd) => Color.lerp(this, foregrounnd, 0.5) ?? this;

  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.alphaBlend(Colors.black.withValues(alpha: amount), this);
  }

  Color brighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.alphaBlend(Colors.white.withValues(alpha: amount), this);
  }

  Color themedLightness(BuildContext context, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Theme.of(context).brightness == Brightness.dark ? brighten(amount) : darken(amount);
  }

  Color themedLightnessFromBrightness(
    Brightness brightness, [
    double amount = 0.1,
  ]) {
    assert(amount >= 0 && amount <= 1);
    return brightness == Brightness.dark ? brighten(amount) : darken(amount);
  }
}
