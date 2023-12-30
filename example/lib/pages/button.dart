import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
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
              width: 160,
              child: ZenitPrimaryButton(
                onPressed: () => print("PrimaryButton was clicked"),
                child: const Text("PrimaryButton"),
              ),
            ),
            const Gap(12),
            SizedBox(
              width: 160,
              child: ZenitSecondaryButton(
                onPressed: () => print("FilledButton was clicked"),
                child: const Text("SecondaryButton"),
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              child: ZenitTextButton(
                onPressed: () => print("FilledButton was clicked"),
                child: const Text("TextButton"),
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
                    "A ListTile with a ZenitPrimaryButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: SizedBox(
                    width: 160,
                    child: ZenitPrimaryButton(
                      onPressed: () => print("Button pressed"),
                      child: const Text("Primary Button"),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "A ListTile with a ZenitSecondaryButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: SizedBox(
                    width: 160,
                    child: ZenitSecondaryButton(
                      onPressed: () => print("Button pressed"),
                      child: const Text("Secondary Button"),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    "A ListTile with a ZenitTextButton",
                  ),
                  subtitle: const Text(
                    "This is the subtitle",
                  ),
                  trailing: SizedBox(
                    width: 160,
                    child: ZenitTextButton(
                      onPressed: () => print("Button pressed"),
                      child: const Text("Text Button"),
                    ),
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
