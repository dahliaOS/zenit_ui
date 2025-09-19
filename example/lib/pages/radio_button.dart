import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitRadioButtonExample extends StatefulWidget {
  const ZenitRadioButtonExample({super.key});

  @override
  State<ZenitRadioButtonExample> createState() => _ZenitRadioButtonExampleState();
}

bool val = false;

class _ZenitRadioButtonExampleState extends State<ZenitRadioButtonExample> {
  double groupValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const ExampleTitle("ZenitRadioButton"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (double i = 0; i < 3; i++) ...[
              ZenitRadioButton<double>(
                value: i,
                groupValue: groupValue,
                onChanged: (value) => setState(() => groupValue = value!),
              ),
              const Gap(16),
            ],
          ],
        ),
        const Gap(24),
        const ExampleSubtitle("ZenitRadioButtonListTile"),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 + 256,
          child: Card(
            child: Column(
              children: [
                for (double d = 0; d < 3; d++) ...[
                  ZenitRadioButtonListTile<double>(
                    title: const Text("ZenitRadioButtonListTile"),
                    subtitle: Text("ZenitRadioButtonListTile is ${d == groupValue ? "selected" : "not selected"}"),
                    value: d,
                    groupValue: groupValue,
                    onChanged: (value) => setState(() => groupValue = value!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
