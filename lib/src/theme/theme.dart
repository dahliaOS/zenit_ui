import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/extensions/extensions.dart';
import 'package:zenit_ui/src/theme/text_theme.dart';
import 'package:zenit_ui/src/theme/zenit_checkbox_theme.dart';
import 'package:zenit_ui/src/theme/zenit_radio_button_theme.dart';
import 'package:zenit_ui/src/theme/zenit_slider_theme.dart';
import 'package:zenit_ui/src/theme/zenit_switch_theme.dart';

export 'package:zenit_ui/src/extensions/extensions.dart';
export 'package:zenit_ui/src/theme/text_theme.dart';
export 'package:zenit_ui/src/theme/zenit_checkbox_theme.dart';
export 'package:zenit_ui/src/theme/zenit_radio_button_theme.dart';
export 'package:zenit_ui/src/theme/zenit_slider_theme.dart';
export 'package:zenit_ui/src/theme/zenit_switch_theme.dart';

mixin ZenitTheme {
  static ZenitSwitchTheme switchTheme(BuildContext context) => Theme.of(context).zenitSwitchTheme;
  static ZenitSliderTheme sliderTheme(BuildContext context) => Theme.of(context).zenitSliderTheme;
  static ZenitRadioButtonTheme radioButtonTheme(BuildContext context) => Theme.of(context).zenitRadioButtonTheme;
  static ZenitCheckboxTheme checkboxTheme(BuildContext context) => Theme.of(context).zenitCheckboxTheme;
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

  final Iterable<ThemeExtension<dynamic>> themeExtensions = [
    ZenitSwitchTheme(
      activeTrackColor: primaryColor,
      inactiveTrackColor: surfaceColor,
      activeThumbColor: foregroundColor,
      //TODO don't like this...
      inactiveThumbColor: foregroundColor.withValues(alpha: 0.35),
      disabledTrackColor: disabledColor,
      disabledThumbColor: backgroundColor,
      outlineColor: outlineColor,
    ),
    ZenitSliderTheme(
      activeTrackColor: primaryColor,
      trackColor: surfaceColor,
      outlineColor: outlineColor,
      thumbColor: foregroundColor,
    ),
    ZenitRadioButtonTheme(
      activeBackgroundColor: primaryColor,
      inactiveBackgroundColor: surfaceColor,
      disabledBackgroundColor: disabledColor,
      thumbColor: backgroundColor,
      outlineColor: outlineColor,
    ),
    ZenitCheckboxTheme(
      activeBackgroundColor: primaryColor,
      inactiveBackgroundColor: surfaceColor,
      foregroundColor: backgroundColor,
      disabledBackgroundColor: disabledColor,
      outlineColor: outlineColor,
    ),
  ];

  if (brightness == Brightness.light) {
    return ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: primaryColor.computeLuminance() > 0.4 ? foregroundColor : backgroundColor,
        secondary: primaryColor,
        onSecondary: primaryColor.computeLuminance() > 0.4 ? foregroundColor : backgroundColor,
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
      extensions: themeExtensions,
    );
  } else {
    return ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        onPrimary: primaryColor.computeLuminance() > 0.4 ? backgroundColor : foregroundColor,
        secondary: primaryColor,
        onSecondary: primaryColor.computeLuminance() > 0.4 ? backgroundColor : foregroundColor,
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
      extensions: themeExtensions,
    );
  }
}

extension ZenitThemeData on ThemeData {
  bool get darkMode => brightness == Brightness.dark;
  Color get accentForegroundColor => colorScheme.primary.computeLuminance() > 0.4 ? Colors.black : Colors.white;
  Color computedForegroundColor(Color color) => color.computeLuminance() > 0.4 ? Colors.black : Colors.white;
  ZenitSwitchTheme get zenitSwitchTheme => extension<ZenitSwitchTheme>()!;
  ZenitSliderTheme get zenitSliderTheme => extension<ZenitSliderTheme>()!;
  ZenitRadioButtonTheme get zenitRadioButtonTheme => extension<ZenitRadioButtonTheme>()!;
  ZenitCheckboxTheme get zenitCheckboxTheme => extension<ZenitCheckboxTheme>()!;
}
