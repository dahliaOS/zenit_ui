library zenit_ui;

import 'package:flutter/material.dart' as material;
import 'package:zenit_ui/src/components/checkbox/checkbox.dart';
import 'package:zenit_ui/src/components/list_tile/switch_list_tile.dart';
import 'package:zenit_ui/src/components/radio_button/radio_button.dart';
import 'package:zenit_ui/src/components/slider/slider.dart';
import 'package:zenit_ui/src/components/switch/switch.dart';
import 'package:zenit_ui/src/components/textfield/text_flield.dart';
import 'package:zenit_ui/src/theme/theme.dart';

// Default exports
export 'package:flutter/material.dart' hide Chip, Switch, Tab, Theme, Radio, SwitchListTile, Checkbox;
export 'package:flutter/widgets.dart';
export 'package:gap/gap.dart';
// Zenit exports
export 'package:zenit_ui/src/components/buttons/buttons.dart';
export 'package:zenit_ui/src/components/checkbox/checkbox.dart';
export 'package:zenit_ui/src/components/chip/chip.dart';
export 'package:zenit_ui/src/components/list_tile/switch_list_tile.dart';
export 'package:zenit_ui/src/components/radio_button/radio_button.dart';
export 'package:zenit_ui/src/components/slider/slider.dart';
export 'package:zenit_ui/src/components/switch/switch.dart';
export 'package:zenit_ui/src/components/textfield/text_flield.dart';
export 'package:zenit_ui/src/layout/responsive/navigation_element.dart';
export 'package:zenit_ui/src/layout/responsive/respsonsive_platform.dart';
export 'package:zenit_ui/src/layout/tab_view/tab.dart';
export 'package:zenit_ui/src/layout/tab_view/tab_page.dart';
export 'package:zenit_ui/src/layout/tab_view/tab_view.dart';
export 'package:zenit_ui/src/theme/colors.dart';
export 'package:zenit_ui/src/theme/theme.dart';

//Type Definitions

//Switch
typedef Switch = ZenitSwitch;
typedef MaterialSwitch = material.Switch;

//Theme
typedef Theme = ZenitTheme;
typedef MaterialTheme = material.Theme;

//TextField
typedef TextField = ZenitTextField;
typedef MaterialTextField = material.TextField;

//Slider
typedef Slider = ZenitSlider;
typedef MaterialSlider = material.Slider;

typedef RadioButton = ZenitRadioButton;
typedef MaterialRadioButton = material.Radio;

typedef SwitchListTile = ZenitSwitchListTile;
typedef MaterialSwitchListTile = material.SwitchListTile;

typedef Checkbox = ZenitCheckbox;
typedef MaterialCheckbox = material.Checkbox;
