// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/colors.dart';

class ZenitTheme {
  late BuildContext context;
  ZenitTheme.of(this.context);

  ThemeData get materialTheme => Theme.of(context);

  Color get primaryColor => materialTheme.primaryColor;

  bool get darkMode => materialTheme.brightness == Brightness.dark;

  Color get cardColor => materialTheme.cardColor;

  Color get surfaceColor => materialTheme.extension<ZenitColorExtension>()!.surfaceColor!;

  Color get backgroundColor => materialTheme.backgroundColor;

  Color get foregroundColor => materialTheme.textTheme.button?.color ?? Colors.white;

  Color get disabledColor => materialTheme.disabledColor;

  Color get iconColor => materialTheme.iconTheme.color!;

  ZenitSwitchTheme get switchTheme => ZenitSwitchTheme(
        activeTrackColor: primaryColor,
        inactiveTrackColor: surfaceColor,
        activeThumbColor: backgroundColor,
        inactiveThumbColor: darkMode ? foregroundColor.withOpacity(0.35) : foregroundColor.withOpacity(0.35),
        disabledTrackColor: disabledColor,
        disabledThumbColor: backgroundColor,
      );

  ZenitSliderTheme get sliderTheme => ZenitSliderTheme(
        activeTrackColor: primaryColor,
        trackColor: primaryColor.withOpacity(0.25),
      );

  ZenitRadioButtonTheme get radioButtonTheme => ZenitRadioButtonTheme(
        activeBackgroundColor: primaryColor,
        inactiveBackgroundColor: surfaceColor,
        activeThumbColor: backgroundColor,
        inactiveThumbColor: surfaceColor,
        disabledBackgroundColor: disabledColor,
      );

  ZenitCheckboxTheme get checkboxTheme => ZenitCheckboxTheme(
        activeBackgroundColor: primaryColor,
        inactiveBackgroundColor: surfaceColor,
        foregroundColor: backgroundColor,
        disabledBackgroundColor: disabledColor,
      );
}

class ThemeEngine {
  const ThemeEngine._();

  static ThemeData create({
    required Color primaryColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color cardColor,
    required Color textColor,
    required ThemeVariant variant,
  }) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      brightness: _resolveThemeBrightness(variant),
      textTheme: TextTheme(
        button: TextStyle(color: textColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: IconThemeData(color: textColor),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: kCardBorderRadius,
          side: BorderSide(color: textColor.withOpacity(0.15)),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      extensions: [
        ZenitColorExtension(
          surfaceColor: surfaceColor,
        ),
      ],
    );
  }

  static ThemeData get zenitDefaultLightTheme => ThemeEngine.create(
        variant: ThemeVariant.light,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFAFAFA),
        surfaceColor: const Color(0xFFE5E5E7),
        cardColor: const Color(0xFFFFFFFF),
        textColor: Colors.black,
      );
  static ThemeData get zenitDefaultDarkTheme => ThemeEngine.create(
        variant: ThemeVariant.dark,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF1C1C1E),
        surfaceColor: const Color(0xFF353535),
        cardColor: const Color(0xFF252528),
        textColor: Colors.white,
      );
}

class ZenitSwitchTheme {
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;

  const ZenitSwitchTheme({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.disabledTrackColor,
    required this.disabledThumbColor,
  });
}

class ZenitSliderTheme {
  final Color activeTrackColor;
  final Color trackColor;

  const ZenitSliderTheme({
    required this.activeTrackColor,
    required this.trackColor,
  });
}

class ZenitRadioButtonTheme {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final Color disabledBackgroundColor;

  const ZenitRadioButtonTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.disabledBackgroundColor,
  });
}

class ZenitCheckboxTheme {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;

  const ZenitCheckboxTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
  });
}

Brightness _resolveThemeBrightness(ThemeVariant? variant) {
  switch (variant) {
    case ThemeVariant.light:
      return Brightness.light;
    case ThemeVariant.dark:
      return Brightness.dark;
    default:
      return Brightness.light;
  }
}

enum ThemeVariant { light, dark }
