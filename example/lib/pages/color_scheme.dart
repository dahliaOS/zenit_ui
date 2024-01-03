import 'package:zenit_ui/zenit_ui.dart';

class ColorSchemeExamplePage extends StatelessWidget {
  const ColorSchemeExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background
          colorSchemeDisplay(cs.background, "Background"),
          colorSchemeDisplay(cs.onBackground, "On Background"),
          // Surface
          colorSchemeDisplay(cs.surface, "Surface"),
          colorSchemeDisplay(cs.onSurface, "On Surface"),
          colorSchemeDisplay(cs.inverseSurface, "Inverse Surface"),
          colorSchemeDisplay(cs.surfaceTint, "Surface Tint"),
          // Primary
          colorSchemeDisplay(cs.primary, "Primary"),
          colorSchemeDisplay(cs.onPrimary, "On Primary"),
          colorSchemeDisplay(cs.inversePrimary, "Inverse Primary"),
          // Secondary
          colorSchemeDisplay(cs.secondary, "Secondary"),
          colorSchemeDisplay(cs.onSecondary, "On Secondary"),
          colorSchemeDisplay(cs.secondaryContainer, "Secondary Container"),
          colorSchemeDisplay(cs.onSecondaryContainer, "On Secondary Container"),
          // Teriary
          colorSchemeDisplay(cs.tertiary, "Tertiary"),
          colorSchemeDisplay(cs.onTertiary, "On Tertiary"),
          // Error
          colorSchemeDisplay(cs.error, "Error"),
          colorSchemeDisplay(cs.onError, "On Error"),
          colorSchemeDisplay(cs.errorContainer, "Error Container"),
          colorSchemeDisplay(cs.onErrorContainer, "On Error Container"),
          // Outline
          colorSchemeDisplay(cs.outline, "Outline"),
          colorSchemeDisplay(cs.outlineVariant, "Outline Variant"),
          // Scrim
          colorSchemeDisplay(cs.scrim, "Scrim"),
          // Shadow
          colorSchemeDisplay(cs.shadow, "Shadow"),
        ],
      ),
    );
  }
}

SizedBox colorSchemeDisplay(Color color, String label) {
  return SizedBox(
    height: 64,
    child: ZenitSection(
      color: color,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color.computeLuminance() > 0.3 ? Colors.black : Colors.white,
          ),
        ),
      ),
    ),
  );
}
