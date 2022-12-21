import 'package:zenit_ui/zenit_ui.dart';

class ZenitCheckboxExample extends StatefulWidget {
  const ZenitCheckboxExample({super.key});

  @override
  State<ZenitCheckboxExample> createState() => _ZenitCheckboxExampleState();
}

bool val = false;

class _ZenitCheckboxExampleState extends State<ZenitCheckboxExample> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ZenitCheckbox(
              value: val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
            ZenitCheckbox(
              value: !val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
            ZenitCheckbox(
              value: val,
              onChanged: (value) => setState(() => val = !val),
            ),
          ],
        ),
        const Gap(24),
        Column(
          children: [
            ZenitCheckbox(
              value: !val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
            ZenitCheckbox(
              value: val,
              onChanged: (value) => setState(() => val = !val),
            ),
            const Gap(16),
            ZenitCheckbox(
              value: !val,
              onChanged: (value) => setState(() => val = !val),
            ),
          ],
        ),
      ],
    );
  }
}
