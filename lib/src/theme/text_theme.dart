import 'package:flutter/material.dart';

// Credits to the yaru team, this file is basically just copied and altered a bit

TextTheme createTextTheme(Color textColor) {
  return TextTheme(
    displayLarge: _ZenitTextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w300,
      textColor: textColor,
    ),
    displayMedium: _ZenitTextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w300,
      textColor: textColor,
    ),
    displaySmall: _ZenitTextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineLarge: _ZenitTextStyle(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineMedium: _ZenitTextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    headlineSmall: _ZenitTextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    titleLarge: _ZenitTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    titleMedium: _ZenitTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    titleSmall: _ZenitTextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodyLarge: _ZenitTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodyMedium: _ZenitTextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    bodySmall: _ZenitTextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    labelLarge: _ZenitTextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    labelMedium: _ZenitTextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
    labelSmall: _ZenitTextStyle(
      fontSize: 9,
      fontWeight: FontWeight.normal,
      textColor: textColor,
    ),
  );
}

class _ZenitTextStyle extends TextStyle {
  final Color textColor;
  const _ZenitTextStyle({
    super.fontSize,
    super.fontWeight,
    required this.textColor,
  }) : super(
          fontFamily: 'Inter',
          package: 'zenit_ui',
          color: textColor,
        );
}
