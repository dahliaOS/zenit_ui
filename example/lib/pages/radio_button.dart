import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

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
    return Row(
      children: [
        Column(
          children: [
            ZenitRadioButton<double>(
              value: 0,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
            const Gap(16),
            ZenitRadioButton<double>(
              value: 1,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
            const Gap(16),
            ZenitRadioButton<double>(
              value: 2,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
          ],
        ),
        const Gap(24),
        Column(
          children: [
            ZenitRadioButton<double>(
              value: 3,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
            const Gap(16),
            ZenitRadioButton<double>(
              value: 4,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
            const Gap(16),
            ZenitRadioButton<double>(
              value: 5,
              groupValue: groupValue,
              onChanged: (value) => setState(() => groupValue = value!),
            ),
          ],
        ),
      ],
    );
  }
}
