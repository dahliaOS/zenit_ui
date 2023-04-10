import 'package:flutter/material.dart';

class ZenitColors {
  static const Color blue = Color(0xFF0073cf);

  const ZenitColors._();
}

class ZenitColorExtension extends ThemeExtension<ZenitColorExtension> {
  const ZenitColorExtension({
    required this.surfaceColor,
  });

  final Color? surfaceColor;

  @override
  ZenitColorExtension copyWith({Color? surfaceColor, Color? danger}) {
    return ZenitColorExtension(
      surfaceColor: surfaceColor ?? this.surfaceColor,
    );
  }

  @override
  ZenitColorExtension lerp(ZenitColorExtension? other, double t) {
    if (other is! ZenitColorExtension) {
      return this;
    }
    return ZenitColorExtension(
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t),
    );
  }
}
