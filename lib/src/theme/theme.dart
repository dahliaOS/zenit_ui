// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/extensions/extensions.dart';
import 'package:zenit_ui/src/theme/text_theme.dart';

export 'package:zenit_ui/src/extensions/extensions.dart';

mixin ZenitTheme {
  static ZenitSwitchTheme switchTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitSwitchTheme(
      activeTrackColor: theme.colorScheme.primary,
      inactiveTrackColor: theme.colorScheme.surface,
      activeThumbColor: theme.colorScheme.onPrimary,
      inactiveThumbColor: theme.colorScheme.onSurface.withValues(alpha: 0.35),
      disabledTrackColor: theme.disabledColor,
      disabledThumbColor: theme.colorScheme.background,
      outlineColor: theme.colorScheme.outline,
    );
  }

  static ZenitSliderTheme sliderTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitSliderTheme(
      activeTrackColor: theme.primaryColor,
      trackColor: theme.colorScheme.surface,
      thumbColor: theme.colorScheme.onPrimary,
      outlineColor: theme.colorScheme.outline,
    );
  }

  static ZenitRadioButtonTheme radioButtonTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitRadioButtonTheme(
      activeBackgroundColor: theme.colorScheme.primary,
      inactiveBackgroundColor: theme.colorScheme.surface,
      disabledBackgroundColor: theme.disabledColor,
      thumbColor: theme.colorScheme.background,
      outlineColor: theme.colorScheme.outline,
    );
  }

  static ZenitCheckboxTheme checkboxTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ZenitCheckboxTheme(
      activeBackgroundColor: theme.colorScheme.primary,
      inactiveBackgroundColor: theme.colorScheme.surface,
      foregroundColor: theme.colorScheme.background,
      disabledBackgroundColor: theme.disabledColor,
      outlineColor: theme.colorScheme.outline,
    );
  }
}

ThemeData createZenitTheme({
  Brightness brightness = Brightness.light,
  Color? primaryColor,
  Color? backgroundColor,
  Color? surfaceColor,
  Color? foregroundColor,
  Color? outlineColor,
  Color? disabledColor,
  Color? hoverColor,
}) {
  // Default Values

  const Color lightBackgroundColor = Color(0xFFFAFAFA);
  const Color lightForegroundColor = Color(0xFF000000);
  const Color lightSurfaceColor = Color(0xFFFFFFFF);
  const Color lightOutlineColor = Color(0xFFD2D2D2);
  const Color lightDisabledColor = Color(0xFFAFAFAF);
  const Color lightHoverColor = Color(0x08000000);
  //---
  const Color darkBackground = Color(0xFF1F1F1F);
  const Color darkForeground = Color(0xFFFAFAFA);
  const Color darkSurfaceColor = Color(0xFF282828);
  const Color darkOutlineColor = Color(0xFF454545);
  const Color darkDisabledColor = Color(0xFF7A7A7A);
  const Color darkHoverColor = Color(0x08FFFFFF);

  final darkMode = brightness == Brightness.dark;
  primaryColor ??= const Color(0xFF00B26E);
  backgroundColor ??= darkMode ? darkBackground : lightBackgroundColor;
  foregroundColor ??= darkMode ? darkForeground : lightForegroundColor;
  surfaceColor ??= darkMode ? darkSurfaceColor : lightSurfaceColor;
  outlineColor ??= darkMode ? darkOutlineColor : lightOutlineColor;
  disabledColor ??= darkMode ? darkDisabledColor : lightDisabledColor;
  hoverColor ??= darkMode ? darkHoverColor : lightHoverColor;
  final textTheme = createTextTheme(foregroundColor);

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
  final cardTheme = CardThemeData(
    clipBehavior: Clip.antiAlias,
    color: backgroundColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: outlineColor),
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
    sizeConstraints: BoxConstraints.tight(const Size.square(52)),
    smallSizeConstraints: BoxConstraints.tight(const Size.square(44)),
    largeSizeConstraints: BoxConstraints.tight(const Size.square(56)),
    extendedSizeConstraints: const BoxConstraints.tightFor(height: 52),
    iconSize: 24,
    shape: RoundedRectangleBorder(
      borderRadius: kDefaultBorderRadiusLarge,
      side: BorderSide(color: outlineColor),
    ),
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
      border: Border.all(color: outlineColor),
    ),
    textStyle: TextStyle(color: foregroundColor),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    margin: EdgeInsets.symmetric(vertical: 8),
    waitDuration: const Duration(milliseconds: 500),
    showDuration: Duration.zero,
  );

  // Divider Theme
  final dividerTheme = DividerThemeData(
    color: outlineColor,
    space: 1,
  );

  // ListTile Theme
  final listTileTheme = ListTileThemeData(
    subtitleTextStyle: TextStyle(
      color: foregroundColor.darken(0.4),
      fontSize: textTheme.bodyMedium?.fontSize,
    ),
  );

  if (brightness == Brightness.light) {
    return ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: primaryColor.computeLuminance() > 0.4 ? foregroundColor : backgroundColor,
        secondary: primaryColor,
        onSecondary: primaryColor.computeLuminance() > 0.4 ? foregroundColor : backgroundColor,
        background: backgroundColor,
        onBackground: foregroundColor,
        surface: surfaceColor,
        onSurface: foregroundColor,
        outline: outlineColor,
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
      listTileTheme: listTileTheme,
      textTheme: textTheme,
      hoverColor: hoverColor,
    );
  } else {
    return ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        onPrimary: primaryColor.computeLuminance() > 0.4 ? backgroundColor : foregroundColor,
        secondary: primaryColor,
        onSecondary: primaryColor.computeLuminance() > 0.4 ? backgroundColor : foregroundColor,
        background: backgroundColor,
        onBackground: foregroundColor,
        surface: surfaceColor,
        onSurface: foregroundColor,
        outline: outlineColor,
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
      listTileTheme: listTileTheme,
      textTheme: textTheme,
      hoverColor: hoverColor,
    );
  }
}

extension ZenitThemeData on ThemeData {
  bool get darkMode => brightness == Brightness.dark;
  Color get accentForegroundColor => colorScheme.primary.computeLuminance() > 0.4 ? Colors.black : Colors.white;
  Color computedForegroundColor(Color color) => color.computeLuminance() > 0.4 ? Colors.black : Colors.white;
}

class ZenitSwitchTheme {
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;
  final Color outlineColor;

  const ZenitSwitchTheme({
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.disabledTrackColor,
    required this.disabledThumbColor,
    required this.outlineColor,
  });

  ZenitSwitchTheme copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    Color? disabledTrackColor,
    Color? disabledThumbColor,
    Color? outlineColor,
  }) {
    return ZenitSwitchTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeThumbColor: activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      disabledTrackColor: disabledTrackColor ?? this.disabledTrackColor,
      disabledThumbColor: disabledThumbColor ?? this.disabledThumbColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }
}

class ZenitSliderTheme {
  final Color activeTrackColor;
  final Color trackColor;
  final Color outlineColor;
  final Color thumbColor;

  const ZenitSliderTheme({
    required this.activeTrackColor,
    required this.trackColor,
    required this.outlineColor,
    required this.thumbColor,
  });

  ZenitSliderTheme copyWith({
    Color? activeTrackColor,
    Color? trackColor,
    Color? outlineColor,
    Color? thumbColor,
  }) {
    return ZenitSliderTheme(
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      trackColor: trackColor ?? this.trackColor,
      outlineColor: outlineColor ?? this.outlineColor,
      thumbColor: thumbColor ?? this.thumbColor,
    );
  }
}

class ZenitRadioButtonTheme {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color disabledBackgroundColor;
  final Color thumbColor;
  final Color outlineColor;

  const ZenitRadioButtonTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.disabledBackgroundColor,
    required this.thumbColor,
    required this.outlineColor,
  });

  ZenitRadioButtonTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? disabledBackgroundColor,
    Color? thumbColor,
    Color? outlineColor,
  }) {
    return ZenitRadioButtonTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      thumbColor: thumbColor ?? this.thumbColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }
}

class ZenitCheckboxTheme {
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color outlineColor;

  const ZenitCheckboxTheme({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
    required this.outlineColor,
  });

  ZenitCheckboxTheme copyWith({
    Color? activeBackgroundColor,
    Color? inactiveBackgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? outlineColor,
  }) {
    return ZenitCheckboxTheme(
      activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
      inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }
}
