import 'package:flutter/material.dart';

extension ObX on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension ColorX on Color {
  Color mix(Color foregrounnd) => Color.lerp(this, foregrounnd, 0.5) ?? this;

  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.alphaBlend(Colors.black.withOpacity(amount), this);
  }

  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    return Color.alphaBlend(Colors.white.withOpacity(amount), this);
  }
}
