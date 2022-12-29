import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitSwitchExample extends StatefulWidget {
  const ZenitSwitchExample({super.key});

  @override
  State<ZenitSwitchExample> createState() => _ZenitSwitchExampleState();
}

bool val = false;

class _ZenitSwitchExampleState extends State<ZenitSwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
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
            const Gap(16),
            ZenitSwitch(
              value: val,
              onChanged: (value) => setState(() => val = !val),
            ),
          ],
        ),
        const Gap(24),
        Column(
          children: [
            ZenitSwitch(
              value: !val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
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
      ],
    );
  }
}
