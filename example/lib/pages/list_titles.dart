import 'package:flutter/material.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitListTilesExample extends StatefulWidget {
  const ZenitListTilesExample({super.key});

  @override
  State<ZenitListTilesExample> createState() => _ZenitListTilesExampleState();
}

class _ZenitListTilesExampleState extends State<ZenitListTilesExample> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("ListTiles on background", style: textStyle),
        ),
        defaultListTile(),
        switchListTile(),
        checkboxListTile(),
        radioButtonListTile(),
        buttonListTile(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("ListTiles in ZenitSections", style: textStyle),
        ),
        ZenitSection(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              defaultListTile(),
              switchListTile(),
              checkboxListTile(),
              radioButtonListTile(),
              buttonListTile()
            ],
          ),
        ),
      ],
    );
  }

  ListTile buttonListTile() {
    return ListTile(
      title: const Text(
        "A ListTile with a button",
      ),
      subtitle: const Text(
        "This is the subtitle",
      ),
      trailing: ZenitFilledButton(
        onPressed: () => print("Button pressed"),
        child: const Text("Button"),
      ),
    );
  }

  ZenitSwitchListTile switchListTile() {
    return ZenitSwitchListTile(
      title: const Text(
        "ZenitSwitchListTile",
      ),
      subtitle: const Text(
        "This is the subtitle",
      ),
      value: value ?? false,
      onChanged: (val) => setState(() => value = val),
    );
  }

  ZenitRadioButtonListTile radioButtonListTile() {
    return ZenitRadioButtonListTile<bool>(
      title: const Text(
        "ZenitRadioButtonListTile",
      ),
      subtitle: const Text(
        "This is the subtitle",
      ),
      value: value,
      groupValue: true,
      onChanged: (val) => setState(() => value = !val!),
    );
  }

  ZenitCheckboxListTile checkboxListTile() {
    return ZenitCheckboxListTile(
      title: const Text(
        "ZenitCheckboxListTile",
      ),
      subtitle: const Text(
        "This is the subtitle",
      ),
      value: value,
      onChanged: (val) => setState(() => value = val!),
    );
  }

  ListTile defaultListTile() {
    return const ListTile(
      title: Text(
        "Default ListTile",
      ),
      subtitle: Text(
        "This is the subtitle",
      ),
    );
  }
}
