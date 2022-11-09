import 'package:zenit_ui/zenit_ui.dart';

class ExampleTheme {
  static ThemeData get lightTheme => ThemeEngine.create(
        variant: ThemeVariant.light,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFAFAFA),
        surfaceColor: const Color(0xFFE0E0E0),
        textColor: Colors.black,
      );
  static ThemeData get darkTheme => ThemeEngine.create(
        variant: ThemeVariant.dark,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF212121),
        surfaceColor: const Color(0xFF303030),
        textColor: Colors.white,
      );
}
