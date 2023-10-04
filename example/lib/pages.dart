import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/pages/button.dart';
import 'package:zenit_ui_example/pages/checkbox.dart';
import 'package:zenit_ui_example/pages/color_scheme.dart';
import 'package:zenit_ui_example/pages/context_menu.dart';
import 'package:zenit_ui_example/pages/icon_button.dart';
import 'package:zenit_ui_example/pages/list_titles.dart';
import 'package:zenit_ui_example/pages/radio_button.dart';
import 'package:zenit_ui_example/pages/sub_pages.dart';
import 'package:zenit_ui_example/pages/switch.dart';
import 'package:zenit_ui_example/pages/tab_view.dart';
import 'package:zenit_ui_example/pages/text.dart';
import 'package:zenit_ui_example/pages/text_field.dart';
import 'package:zenit_ui_example/pages/welcome.dart';

final examplePages = <ZenitLayoutItem>[
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Welcome"),
    pageBuilder: (context) => const ZenitWelcome(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.info_rounded : Icons.info_outline_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Button"),
    pageBuilder: (context) => const ZenitButtonExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.touch_app_rounded : Icons.touch_app_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Switch"),
    pageBuilder: (context) => const ZenitSwitchExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.toggle_on_rounded : Icons.toggle_off_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Checkbox"),
    pageBuilder: (context) => const ZenitCheckboxExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.check_box_rounded : Icons.check_box_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("RadioButton"),
    pageBuilder: (context) => const ZenitRadioButtonExample(),
    iconBuilder: (context, selected) => Icon(selected
        ? Icons.radio_button_checked_rounded
        : Icons.radio_button_off_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("TextField"),
    pageBuilder: (context) => const ZenitTextFieldExample(),
    iconBuilder: (context, selected) => const Icon(Icons.text_format_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("IconButton"),
    pageBuilder: (context) => const ZenitIconButtonExample(),
    iconBuilder: (context, selected) => Icon(selected
        ? Icons.emoji_emotions_rounded
        : Icons.emoji_emotions_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Tab View"),
    pageBuilder: (context) => const ZenitTabViewExample(),
    iconBuilder: (context, selected) => Transform.flip(
      flipX: true,
      child: Icon(selected ? Icons.tab_rounded : Icons.tab_unselected_rounded),
    ),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Context Menu"),
    pageBuilder: (context) => const ZenitContextMenuExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.menu_open_rounded : Icons.menu_rounded),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("List Tiles"),
    pageBuilder: (context) => const ZenitListTilesExample(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.list_alt_rounded : Icons.list_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Text Styles"),
    pageBuilder: (context) => const TextExamplePage(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.text_fields_rounded : Icons.text_fields_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Colors"),
    pageBuilder: (context) => const ColorSchemeExamplePage(),
    iconBuilder: (context, selected) =>
        Icon(selected ? Icons.color_lens_rounded : Icons.color_lens_outlined),
  ),
  ZenitLayoutItem(
    titleBuilder: (context) => const Text("Sub pages"),
    pageBuilder: (context) => const SubPagesExample(),
    iconBuilder: (context, selected) => const Icon(Icons.subtitles_rounded),
  ),
];
