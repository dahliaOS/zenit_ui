import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/pages/checkbox.dart';
import 'package:zenit_ui_example/pages/icon_button.dart';
import 'package:zenit_ui_example/pages/list_titles.dart';
import 'package:zenit_ui_example/pages/option_button.dart';
import 'package:zenit_ui_example/pages/radio_button.dart';
import 'package:zenit_ui_example/pages/switch.dart';
import 'package:zenit_ui_example/pages/tab_view.dart';
import 'package:zenit_ui_example/pages/window_controls.dart';
import 'package:zenit_ui_example/pages/zenit_components.dart';

final examplePages = <ZenitLayoutItem>[
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Welcome"),
    pageBuilder: (context) => const ZenitComponentsExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.info_rounded : Icons.info_outline_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("ZenitSwitch"),
    pageBuilder: (context) => const ZenitSwitchExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.toggle_on_rounded : Icons.toggle_off_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("ZenitCheckbox"),
    pageBuilder: (context) => const ZenitCheckboxExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.check_box_rounded : Icons.check_box_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("ZenitRadioButton"),
    pageBuilder: (context) => const ZenitRadioButtonExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("ZenitIconButton"),
    pageBuilder: (context) => const ZenitIconButtonExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.emoji_emotions_rounded : Icons.emoji_emotions_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("ZenitOptionButton"),
    pageBuilder: (context) => const ZenitOptionButtonExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.bubble_chart_rounded : Icons.bubble_chart_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Tab View"),
    pageBuilder: (context) => const ZenitTabViewExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.tab_rounded : Icons.tab_unselected_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("List Tiles"),
    pageBuilder: (context) => const ZenitListTilesExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.list_alt_rounded : Icons.list_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Window Controls"),
    pageBuilder: (context) => const ZenitWindowControlsExample(),
    iconBuilder: (context, selected) => Icon(selected ? Icons.window_rounded : Icons.window_outlined),
  ),
];
