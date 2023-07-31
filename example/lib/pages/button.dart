import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/pages/welcome.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitButtonExample extends StatefulWidget {
  const ZenitButtonExample({super.key});

  @override
  State<ZenitButtonExample> createState() => _ZenitButtonExampleState();
}

bool val = true;

class _ZenitButtonExampleState extends State<ZenitButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(8),
        const ExampleTitle("ZenitButton"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: kButtonWidth,
              child: ZenitTextButton(
                onPressed: () => print("TextButton was clicked"),
                child: const Text("TextButton"),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: kButtonWidth,
              child: ZenitFilledButton(
                onPressed: () => print("FilledButton was clicked"),
                child: const Text("FilledButton"),
              ),
            ),
            const Gap(16),
            SizedBox(
              width: kButtonWidth,
              child: ZenitElevatedButton(
                onPressed: () => print("FilledButton was clicked"),
                foregroundColor: Colors.white,
                child: const Text("ElevatedButton"),
              ),
            ),
          ],
        ),
        const Gap(24),
        const ExampleSubtitle("Custom ListTiles with ZenitButtons"),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 + 256,
          child: ZenitSection(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "A ListTile with a ZenitTextButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: ZenitTextButton(
                    onPressed: () => print("Button pressed"),
                    child: const Text("Text Button"),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "A ListTile with a ZenitFilledButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: ZenitFilledButton(
                    onPressed: () => print("Button pressed"),
                    child: const Text("Filled Button"),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "A ListTile with a ZenitElevatedButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: ZenitElevatedButton(
                    onPressed: () => print("Button pressed"),
                    child: const Text("Elevated Button"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
