// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

export 'package:zenit_ui/src/extensions/extensions.dart';

mixin ZenitTheme {
  static ZenitSwitchTheme switchTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitSwitchTheme(
      activeTrackColor: theme.primaryColor,
      inactiveTrackColor: theme.surfaceColor,
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
      inactiveBackgroundColor: theme.surfaceColor,
      disabledBackgroundColor: theme.disabledColor,
      thumbColor: theme.colorScheme.background,
    );
  }

  static ZenitCheckboxTheme checkboxTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitCheckboxTheme(
      activeBackgroundColor: theme.primaryColor,
      inactiveBackgroundColor: theme.surfaceColor,
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
  Color? foregroundColor,
}) {
  // Default Values

  const Color lightBackground = Color(0xFFFAFAFA);
  const Color lightForeground = Color(0xFF000000);
  const Color darkBackground = Color(0xFF252525);
  const Color darkForeground = Color(0xFFFAFAFA);

  final darkMode = brightness == Brightness.dark;
  primaryColor ??= const Color(0xFF0073cf);
  backgroundColor ??= (darkMode ? darkBackground : lightBackground);
  foregroundColor ??= (darkMode ? darkForeground : lightForeground);
  surfaceColor ??= foregroundColor.withAlpha(20);

  // AppBar Theme
  final appBarTheme = AppBarTheme(
    backgroundColor: surfaceColor,
    titleTextStyle: TextStyle(
      color: foregroundColor,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  );

  // Icon Theme
  final iconTheme = IconThemeData(color: foregroundColor);

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
    backgroundColor: surfaceColor,
    foregroundColor: foregroundColor,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    shape: const StadiumBorder(),
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
      color: foregroundColor,
      borderRadius: kDefaultBorderRadiusExtraLarge,
    ),
    textStyle: TextStyle(color: backgroundColor),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    waitDuration: const Duration(milliseconds: 500),
    showDuration: Duration.zero,
  );

  // Divider Theme
  final dividerTheme = DividerThemeData(
    color: foregroundColor.withOpacity(0.2),
    space: 1,
  );

  if (brightness == Brightness.light) {
    return ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        background: backgroundColor,
        onBackground: foregroundColor,
        surface: surfaceColor,
        onSurface: foregroundColor,
      ),
    ).copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      iconTheme: iconTheme,
      cardTheme: cardTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      pageTransitionsTheme: pageTransitionsTheme,
      tooltipTheme: tooltipTheme,
      dividerTheme: dividerTheme,
    );
  } else {
    return ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryColor,
        background: backgroundColor,
        onBackground: foregroundColor,
        surface: surfaceColor,
        onSurface: foregroundColor,
      ),
    ).copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: appBarTheme,
      iconTheme: iconTheme,
      cardTheme: cardTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      pageTransitionsTheme: pageTransitionsTheme,
      tooltipTheme: tooltipTheme,
      dividerTheme: dividerTheme,
    );
  }
}

extension on Map<Object, ThemeExtension<dynamic>> {
  T? maybeGet<T>() {
    return this[T] as T?;
  }

  T get<T>() {
    final element = maybeGet<T>();

    if (element != null) return element;

    throw Exception("No theme extension $T found in current ThemeData");
  }
}

extension ZenitThemeData on ThemeData {
  Color get surfaceColor => colorScheme.surface;
  Color get foregroundColor => textTheme.labelLarge?.color ?? Colors.white;
  Color get primaryColor => colorScheme.primary;
  bool get darkMode => brightness == Brightness.dark;
  Color get accentForegroundColor => primaryColor.computeLuminance() > 0.4 ? Colors.black : Colors.white;
  Color computedForegroundColor(Color color) => color.computeLuminance() > 0.4 ? Colors.black : Colors.white;
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

  ZenitSwitchTheme copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    Color? disabledTrackColor,
    Color? disabledThumbColor,
  }) {
    return ZenitSwitchTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeThumbColor: activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      disabledTrackColor: disabledTrackColor ?? this.disabledTrackColor,
      disabledThumbColor: disabledThumbColor ?? this.disabledThumbColor,
    );
  }
}

class ZenitSliderTheme {
  final Color activeTrackColor;
  final Color trackColor;

  const ZenitSliderTheme({
    required this.activeTrackColor,
    required this.trackColor,
  });

  ZenitSliderTheme copyWith({
    Color? activeTrackColor,
    Color? trackColor,
  }) {
    return ZenitSliderTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      trackColor: trackColor ?? this.trackColor,
    );
  }
}

class ZenitRadioButtonTheme {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color disabledBackgroundColor;
  final Color thumbColor;

  const ZenitRadioButtonTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.disabledBackgroundColor,
    required this.thumbColor,
  });

  ZenitRadioButtonTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? disabledBackgroundColor,
    Color? thumbColor,
  }) {
    return ZenitRadioButtonTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      thumbColor: thumbColor ?? this.thumbColor,
    );
  }
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

  ZenitCheckboxTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
  }) {
    return ZenitCheckboxTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
    );
  }
}
