import 'package:flutter/material.dart';

// Credits to the yaru team, this file is basically just copied and altered a bit

TextTheme createTextTheme(Color textColor) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w300,
      color: textColor,
    ).asZenitTextStyle(),
    displayMedium: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w300,
      color: textColor,
    ).asZenitTextStyle(),
    displaySmall: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    bodySmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
    labelSmall: TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.normal,
      color: textColor,
    ).asZenitTextStyle(),
  );
}

extension TextStyleX on TextStyle {
  TextStyle asZenitTextStyle() {
    return copyWith(
      fontFamily: 'Inter',
      package: 'zenit_ui',
      overflow: TextOverflow.ellipsis,
    );
  }
}
