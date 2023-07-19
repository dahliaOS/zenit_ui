import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitSwitchExample extends StatefulWidget {
  const ZenitSwitchExample({super.key});

  @override
  State<ZenitSwitchExample> createState() => _ZenitSwitchExampleState();
}

bool val = true;

class _ZenitSwitchExampleState extends State<ZenitSwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(8),
        const ExampleTitle("ZenitSwitch"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZenitSwitch(
              value: val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
            ZenitSwitch(
              value: !val,
              onChanged: (value) => setState(() => val = !val),
            ),
          ],
        ),
        const Gap(24),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 + 256,
          child: Card(
            child: Column(
              children: [
                for (int i = 0; i < 2; i++) ...[
                  ZenitSwitchListTile(
                    title: const Text("ZenitSwitchListTile"),
                    subtitle: Text("ZenitSwitchListTile is ${val ? "on" : "off"}"),
                    value: i.isEven ? val : !val,
                    onChanged: (value) => setState(() => val = !val),
                  ),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
