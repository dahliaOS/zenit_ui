import 'package:zenit_ui/zenit_ui.dart';

class ZenitListTilesExample extends StatefulWidget {
  const ZenitListTilesExample({super.key});

  @override
  State<ZenitListTilesExample> createState() => _ZenitListTilesExampleState();
}

class _ZenitListTilesExampleState extends State<ZenitListTilesExample> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          title: Text("Default ListTile"),
          subtitle: Text("subtitle"),
        ),
        ZenitSwitchListTile(
          title: const Text("ZenitSwitchListTile"),
          subtitle: const Text("subtitle"),
          value: value,
          onChanged: (val) => setState(() => value = val),
        ),
      ],
    );
  }
}
