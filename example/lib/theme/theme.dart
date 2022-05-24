import 'package:zenit_ui/zenit_ui.dart';

class ExampleTheme {
  static ThemeData get lightTheme => ThemeEngine.create(
        darkVariant: false,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceColor: const Color(0xFFE5E5E5),
        textColor: Colors.black,
      );
  static ThemeData get darkTheme => ThemeEngine.create(
        darkVariant: true,
        primaryColor: ZenitColors.blue,
        backgroundColor: const Color(0xFF121212),
        surfaceColor: const Color(0xFF262626),
        textColor: Colors.white,
      );
}
