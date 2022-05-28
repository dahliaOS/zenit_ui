// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:zenit_ui/src/theme/colors.dart';

typedef MaterialThemeData = m.ThemeData;

typedef MaterialTheme = m.Theme;

class Theme {
  late BuildContext context;
  Theme.of(this.context);

  MaterialThemeData get materialTheme => m.Theme.of(context);

  Color get primaryColor => materialTheme.primaryColor;

  bool get darkMode => materialTheme.brightness == m.Brightness.dark;

  Color get surfaceColor => materialTheme.cardColor;

  Color get areaColor => materialTheme.cardColor;

  Color get backgroundColor => materialTheme.backgroundColor;

  Color get foregroundColor =>
      materialTheme.textTheme.button?.color ?? m.Colors.white;
}

// ignore: avoid_classes_with_only_static_members
class ThemeEngine {
  static MaterialThemeData create({
    Color? primaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    bool? darkVariant,
    Color? textColor,
  }) {
    return MaterialThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: surfaceColor,
      brightness: darkVariant != null
          ? (darkVariant ? m.Brightness.dark : m.Brightness.light)
          : null,
      colorScheme: darkVariant != null
          ? (darkVariant
              ? const m.ColorScheme.dark()
              : const m.ColorScheme.light())
          : null,
      textTheme: m.TextTheme(
        button: m.TextStyle(color: textColor),
      ),
    );
  }

  static MaterialThemeData get zenitDefaultLightTheme => ThemeEngine.create(
        darkVariant: false,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceColor: const Color(0xFFE5E5E5),
        textColor: m.Colors.black,
      );
  static MaterialThemeData get zenitDefaultDarkTheme => ThemeEngine.create(
        darkVariant: true,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF121212),
        surfaceColor: const Color(0xFF262626),
        textColor: m.Colors.white,
      );
}
