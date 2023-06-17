import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

const kButtonWidth = 132.0;

class ZenitComponentsExample extends StatefulWidget {
  const ZenitComponentsExample({super.key});

  @override
  State<ZenitComponentsExample> createState() => _ZenitComponentsExampleState();
}

class _ZenitComponentsExampleState extends State<ZenitComponentsExample> {
  double val = 0.5;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(48),
          Image.asset(
            "assets/banner.png",
            width: 557,
            height: 192,
          ),
          const Gap(48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: kButtonWidth,
                child: ZenitTextButton(
                  onPressed: () => print("TextButton was clicked"),
                  child: const Text("TextButton"),
                ),
              ),
              const Gap(16),
              SizedBox(
                width: kButtonWidth,
                child: ZenitFilledButton(
                  onPressed: () => print("FilledButton was clicked"),
                  child: const Text("FilledButton"),
                ),
              ),
              const Gap(16),
              SizedBox(
                width: kButtonWidth,
                child: ZenitElevatedButton(
                  onPressed: () => print("FilledButton was clicked"),
                  foregroundColor: Colors.white,
                  child: const Text("ElevatedButton"),
                ),
              ),
            ],
          ),
          const Gap(16),
          SizedBox(
            width: 300,
            child: ZenitTextField(
              controller: TextEditingController(),
              hint: "ZenitTextField",
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 325,
            child: ZenitSlider(
              value: val,
              onChanged: (value) => setState(() => val = value),
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 325,
            child: Card(
              child: ListTile(
                title: const Text("Selectables"),
                subtitle: Text(value ? "On" : "Off"),
                onTap: () => setState(() => value = !value),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZenitRadioButton(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                    const Gap(8),
                    ZenitCheckbox(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                    const Gap(8),
                    ZenitSwitch(
                      value: value,
                      onChanged: (val) => setState(() => value = val),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(16),
          ZenitIconButton(
            icon: Icons.add,
            onPressed: () {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: const Text("Test"), actions: [
                ZenitIconButton(
                  icon: Icons.close,
                  hoverColor: Theme.of(context).foregroundColor.withOpacity(0.1),
                  onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners(),
                )
              ]));
            },
          ),
          const Gap(48),
        ],
      ),
    );
  }
}
