import 'dart:ui';

extension ObX on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension ColorX on Color {
  Color mix(Color foregrounnd) => Color.lerp(this, foregrounnd, 0.5) ?? this;
}
