import 'package:zenit_ui/zenit_ui.dart';

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
          PrimaryButton(
            onPressed: () => ZenitWindow.instance.setAsFrameless(),
            backgroundColor: ZenitColors.blue,
            foregroundColor: const Color(0xffffffff),
            child: const Text(
              "Primary Button",
            ),
          ),
          const Gap(16),
          SecondaryButton(
            onPressed: () => print("SecondaryButton was clicked"),
            child: const Text(
              "Secondary Button",
            ),
          ),
          const Gap(16),
          SizedBox(
            width: 300,
            child: ZenitTextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                label: Text("Text Box"),
              ),
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
              ScaffoldMessenger.of(context)
                  .showMaterialBanner(MaterialBanner(content: const Text("Test"), actions: [
                ZenitIconButton(
                  icon: Icons.close,
                  hoverColor: ZenitTheme.of(context).foregroundColor.withOpacity(0.1),
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
