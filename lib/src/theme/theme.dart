// ignore_for_file: deprecated_member_use

import 'package:zenit_ui/zenit_ui.dart';

class ZenitTheme {
  late BuildContext context;
  ZenitTheme.of(this.context);

  ThemeData get materialTheme => MaterialTheme.of(context);

  Color get primaryColor => materialTheme.primaryColor;

  bool get darkMode => materialTheme.brightness == Brightness.dark;

  Color get surfaceColor => materialTheme.cardColor;

  Color get backgroundColor => materialTheme.backgroundColor;

  Color get foregroundColor => materialTheme.textTheme.button?.color ?? Colors.white;

  Color get disabledColor => materialTheme.disabledColor;

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

// ignore: avoid_classes_with_only_static_members
class ThemeEngine {
  static ThemeData create({
    required Color primaryColor,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color textColor,
    required ThemeVariant variant,
  }) {
    return ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: surfaceColor,
      brightness: _resolveThemeBrightness(variant),
      textTheme: TextTheme(
        button: TextStyle(color: textColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        titleTextStyle: TextStyle(color: textColor, fontSize: 17, fontWeight: FontWeight.w600),
      ),
      iconTheme: IconThemeData(color: textColor),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: surfaceColor, width: 2),
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
    );
  }

  static ThemeData get zenitDefaultLightTheme => ThemeEngine.create(
        variant: ThemeVariant.light,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFAFAFA),
        surfaceColor: const Color(0xFFD9D9D9),
        textColor: Colors.black,
      );
  static ThemeData get zenitDefaultDarkTheme => ThemeEngine.create(
        variant: ThemeVariant.dark,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF121212),
        surfaceColor: const Color(0xFF3D3D3D),
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
