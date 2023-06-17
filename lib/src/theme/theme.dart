// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

mixin ZenitTheme {
  static ZenitSwitchTheme switchTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitSwitchTheme(
      activeTrackColor: theme.primaryColor,
      inactiveTrackColor: theme.elementColor,
      activeThumbColor: theme.colorScheme.background,
      inactiveThumbColor:
          theme.darkMode ? theme.foregroundColor.withOpacity(0.35) : theme.foregroundColor.withOpacity(0.35),
      disabledTrackColor: theme.disabledColor,
      disabledThumbColor: theme.colorScheme.background,
    );
  }

  static ZenitSliderTheme sliderTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitSliderTheme(
      activeTrackColor: theme.primaryColor,
      trackColor: theme.primaryColor.withOpacity(0.25),
    );
  }

  static ZenitRadioButtonTheme radioButtonTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitRadioButtonTheme(
      activeBackgroundColor: theme.primaryColor,
      inactiveBackgroundColor: theme.elementColor,
      activeThumbColor: theme.colorScheme.background,
      inactiveThumbColor: theme.elementColor,
      disabledBackgroundColor: theme.disabledColor,
    );
  }

  static ZenitCheckboxTheme checkboxTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitCheckboxTheme(
      activeBackgroundColor: theme.primaryColor,
      inactiveBackgroundColor: theme.elementColor,
      foregroundColor: theme.colorScheme.background,
      disabledBackgroundColor: theme.disabledColor,
    );
  }
}

ThemeData createZenitTheme({
  Brightness? brightness = Brightness.light,
  Color? primaryColor,
  Color? backgroundColor,
  Color? surfaceColor,
  Color? elementColor,
  Color? foregroundColor,
}) {
  // Default Values
  final darkMode = brightness == Brightness.dark;
  final primary = primaryColor ?? const Color(0xFF0073cf);
  final foreground = foregroundColor ?? (darkMode ? const Color(0xffffffff) : const Color(0xFF000000));

  // AppBar Theme
  final appBarTheme = AppBarTheme(
    backgroundColor: surfaceColor,
    titleTextStyle: TextStyle(
      color: foreground,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  );

  // Icon Theme
  final iconTheme = IconThemeData(color: foreground);

  // Card Theme
  const cardTheme = CardTheme(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: kCardBorderRadius,
    ),
  );

  // FloatingActionButton Theme
  final floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
  );

  // PageTransitionsTheme
  const pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    },
  );

  // Tooltip Theme
  final tooltipTheme = TooltipThemeData(
    decoration: BoxDecoration(
      color: surfaceColor,
      borderRadius: kDefaultBorderRadiusMedium,
      border: Border.all(
        color: foreground.withOpacity(0.15),
      ),
    ),
    textStyle: TextStyle(color: foregroundColor),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    waitDuration: const Duration(seconds: 1),
  );

  if (brightness == Brightness.light) {
    return ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: primary,
        background: backgroundColor ?? const Color(0xFFEDEDED),
        onBackground: elementColor ?? const Color(0xFF1C1C1E),
        surface: surfaceColor ?? const Color(0xFFFFFFFF),
        onSurface: elementColor ?? const Color(0xFFD6D6D6),
      ),
    ).copyWith(
      useMaterial3: false,
      appBarTheme: appBarTheme,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundColor ?? const Color(0xFFEDEDED),
      iconTheme: iconTheme,
      cardTheme: cardTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      pageTransitionsTheme: pageTransitionsTheme,
      tooltipTheme: tooltipTheme,
    );
  } else {
    return ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: primary,
        background: backgroundColor ?? const Color(0xFF1C1C1E),
        onBackground: elementColor ?? const Color(0xFF353535),
        surface: surfaceColor ?? const Color(0xFF252528),
        onSurface: elementColor ?? const Color(0xFF353535),
      ),
    ).copyWith(
      useMaterial3: false,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundColor ?? const Color(0xFF1C1C1E),
      appBarTheme: appBarTheme,
      iconTheme: iconTheme,
      cardTheme: cardTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      pageTransitionsTheme: pageTransitionsTheme,
      tooltipTheme: tooltipTheme,
    );
  }
}

extension ZenitThemeData on ThemeData {
  Color get surfaceColor => colorScheme.surface;
  Color get elementColor => colorScheme.onSurface;
  Color get foregroundColor => textTheme.button?.color ?? Colors.white;
  Color get primaryColor => colorScheme.primary;
  bool get darkMode => brightness == Brightness.dark;
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
