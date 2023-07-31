import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitIconButtonExample extends StatelessWidget {
  const ZenitIconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const ExampleTitle("ZenitIconButton"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZenitIconButton(
              icon: Icons.remove_red_eye,
              onPressed: () {},
            ),
            const Gap(16),
            ZenitIconButton(
              icon: Icons.add,
              onPressed: () {},
            ),
            const Gap(16),
            ZenitIconButton(
              icon: Icons.close,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
