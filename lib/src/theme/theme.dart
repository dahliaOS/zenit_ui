// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart'
    show ThemeData, Theme, Brightness, Colors, TextTheme, TextStyle;
import 'package:flutter/widgets.dart';
import 'package:zenit_ui/src/theme/colors.dart';

class ZenitTheme {
  late BuildContext context;
  ZenitTheme.of(this.context);

  ThemeData get materialTheme => Theme.of(context);

  Color get primaryColor => materialTheme.primaryColor;

  bool get darkMode => materialTheme.brightness == Brightness.dark;

  Color get surfaceColor => materialTheme.cardColor;

  Color get areaColor => materialTheme.cardColor;

  Color get backgroundColor => materialTheme.backgroundColor;

  Color get foregroundColor =>
      materialTheme.textTheme.button?.color ?? Colors.white;

  ZenitSwitchTheme get switchTheme => ZenitSwitchTheme(
        activeTrackColor: primaryColor,
        inactiveTrackColor: surfaceColor,
        activeThumbColor: backgroundColor,
        inactiveThumbColor: darkMode
            ? const Color(0xFFFAFAFA).withOpacity(0.75)
            : const Color(0xFF212121).withOpacity(0.75),
      );
}

// ignore: avoid_classes_with_only_static_members
class ThemeEngine {
  static ThemeData create({
    Color? primaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    bool? darkVariant,
    Color? textColor,
  }) {
    return ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: surfaceColor,
      brightness: darkVariant != null
          ? (darkVariant ? Brightness.dark : Brightness.light)
          : null,
      textTheme: TextTheme(
        button: TextStyle(color: textColor),
      ),
    );
  }

  static ThemeData get zenitDefaultLightTheme => ThemeEngine.create(
        darkVariant: false,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceColor: const Color(0xFFE5E5E5),
        textColor: Colors.black,
      );
  static ThemeData get zenitDefaultDarkTheme => ThemeEngine.create(
        darkVariant: true,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF121212),
        surfaceColor: const Color(0xFF262626),
        textColor: Colors.white,
      );
}

class ZenitSwitchTheme {
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;

  const ZenitSwitchTheme({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
  });
}
