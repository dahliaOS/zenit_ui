import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

class TextExamplePage extends StatelessWidget {
  const TextExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textStyleDisplay(textTheme),
          textStyleHeadline(textTheme),
          textStyleTitle(textTheme),
          textStyleBody(textTheme),
          textStyleLabel(textTheme),
        ],
      ),
    );
  }

  ZenitSection textStyleTitle(TextTheme textTheme) {
    return ZenitSection(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "TextStyle titleLarge",
              style: textTheme.titleLarge,
            ),
            const Gap(4),
            Text(
              "TextStyle titleMedium",
              style: textTheme.titleMedium,
            ),
            const Gap(4),
            Text(
              "TextStyle titleSmall",
              style: textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  ZenitSection textStyleLabel(TextTheme textTheme) {
    return ZenitSection(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "TextStyle labelLarge",
              style: textTheme.labelLarge,
            ),
            const Gap(4),
            Text(
              "TextStyle labelMedium",
              style: textTheme.labelMedium,
            ),
            const Gap(4),
            Text(
              "TextStyle labelSmall",
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  ZenitSection textStyleHeadline(TextTheme textTheme) {
    return ZenitSection(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "TextStyle headlineLarge",
              style: textTheme.headlineLarge,
            ),
            const Gap(4),
            Text(
              "TextStyle headlineMedium",
              style: textTheme.headlineMedium,
            ),
            const Gap(4),
            Text(
              "TextStyle headlineSmall",
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }

  ZenitSection textStyleBody(TextTheme textTheme) {
    return ZenitSection(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "TextStyle bodyLarge",
              style: textTheme.bodyLarge,
            ),
            const Gap(4),
            Text(
              "TextStyle bodyMedium",
              style: textTheme.bodyMedium,
            ),
            const Gap(4),
            Text(
              "TextStyle bodyMedium",
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  ZenitSection textStyleDisplay(TextTheme textTheme) {
    return ZenitSection(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "TextStyle displayLarge",
              style: textTheme.displayLarge,
            ),
            const Gap(4),
            Text(
              "TextStyle displayMedium",
              style: textTheme.displayMedium,
            ),
            const Gap(4),
            Text(
              "TextStyle displaySmall",
              style: textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
