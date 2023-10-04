import 'package:flutter/services.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitContextMenuExample extends StatelessWidget {
  const ZenitContextMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ZenitContextMenuRegion(
      contextMenu: ZenitContextMenuData(
        entries: [
          ZenitContextMenuItem(
            leading: const Icon(Icons.arrow_back_rounded),
            label: "Backward",
            onPressed: () {
              print("back");
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.arrowLeft, alt: true),
          ),
          ZenitContextMenuItem(
            leading: const Icon(Icons.arrow_forward_rounded),
            label: ("Forward"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.arrowRight, alt: true),
          ),
          ZenitContextMenuItem(
            leading: const Icon(Icons.replay_rounded),
            label: ("Reload"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyR, control: true),
          ),
          const ZenitContextMenuDivider(),
          ZenitContextMenuItem(
            leading: const Icon(Icons.add_rounded),
            label: ("Add something"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyA, control: true),
          ),
          ZenitContextMenuItem(
            leading: const FlutterLogo(),
            label: ("Uhh Flutter Logo"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyF, control: true),
          ),
          const ZenitContextMenuDivider(),
          ZenitContextMenuItem(
            leading: const Icon(Icons.copy_rounded),
            label: ("Copy text"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyC, control: true),
          ),
          ZenitContextMenuItem(
            leading: const Icon(Icons.cut_rounded),
            label: ("Cut text"),
            onPressed: () {},
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyX, control: true),
          ),
          ZenitContextMenuItem(
            leading: const Icon(Icons.print_rounded),
            label: ("Print"),
            onPressed: () => print("Print"),
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyP, control: true),
          ),
          ZenitNestedContextMenuItem(
            children: [
              ZenitContextMenuItem(
                leading: const Icon(Icons.copy_rounded),
                label: ("Copy text"),
                onPressed: () {},
                shortcut: const SingleActivator(LogicalKeyboardKey.keyC,
                    control: true),
              ),
              ZenitContextMenuItem(
                leading: const Icon(Icons.cut_rounded),
                label: ("Cut text"),
                onPressed: () {},
                shortcut: const SingleActivator(LogicalKeyboardKey.keyX,
                    control: true),
              ),
              ZenitContextMenuItem(
                leading: const Icon(Icons.print_rounded),
                label: ("Print"),
                onPressed: () {},
              ),
            ],
            label: "Nested",
          ),
        ],
      ),
      child: const SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(),
          child: Center(
            child: Text("Right click anywhere!"),
          ),
        ),
      ),
    );
  }
}
