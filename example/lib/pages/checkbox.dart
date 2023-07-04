import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitCheckboxExample extends StatefulWidget {
  const ZenitCheckboxExample({super.key});

  @override
  State<ZenitCheckboxExample> createState() => _ZenitCheckboxExampleState();
}

bool val = false;

class _ZenitCheckboxExampleState extends State<ZenitCheckboxExample> {
  final List<bool?> _checkboxValues = [true, null, false];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            for (int i = 0; i < _checkboxValues.length; i++) ...[
              ZenitCheckbox(
                value: _checkboxValues[i],
                onChanged: (value) => setState(() => _checkboxValues[i] = value),
                tristate: true,
              ),
              const Gap(16),
            ]
          ],
        ),
      ],
    );
  }
}
