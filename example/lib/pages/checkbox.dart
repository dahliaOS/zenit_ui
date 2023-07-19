import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(8),
        const ExampleTitle("ZenitCheckbox"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
        const Gap(24),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 + 256,
          child: Card(
            child: Column(
              children: [
                for (int i = 0; i < _checkboxValues.length; i++) ...[
                  ZenitCheckboxListTile(
                    title: const Text("ZenitCheckboxListTile"),
                    subtitle: Text("ZenitCheckboxListTile is ${resolve(_checkboxValues[i])}"),
                    value: _checkboxValues[i],
                    onChanged: (value) => setState(() => _checkboxValues[i] = value),
                    tristate: true,
                  )
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  String resolve(bool? val) {
    if (val == null) {
      return "intermedate";
    } else if (val) {
      return "checked";
    } else {
      return "unchecked";
    }
  }
}
