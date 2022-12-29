import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitOptionButtonExample extends StatelessWidget {
  const ZenitOptionButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZenitOptionButton(
          child: const Text("Option 1"),
          onPressed: () {},
        ),
        const Gap(16),
        ZenitOptionButton(
          child: const Text("Option 2"),
          onPressed: () {},
        ),
        const Gap(16),
        ZenitOptionButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.abc),
              Gap(8),
              Text("Option 3"),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
