library zenit_ui;

import 'package:flutter/material.dart' as material;
import 'package:zenit_ui/src/controls/slider/slider.dart';
import 'package:zenit_ui/src/controls/switch/switch.dart';
import 'package:zenit_ui/src/controls/textfield/text_flield.dart';
import 'package:zenit_ui/src/theme/theme.dart';

export 'package:flutter/material.dart' hide Chip, Switch, Tab, Theme;
export 'package:flutter/widgets.dart';
export 'package:gap/gap.dart';
export 'package:zenit_ui/src/controls/buttons/buttons.dart';
export 'package:zenit_ui/src/controls/chip/chip.dart';
export 'package:zenit_ui/src/controls/slider/slider.dart';
export 'package:zenit_ui/src/controls/switch/switch.dart';
export 'package:zenit_ui/src/controls/textfield/text_flield.dart';
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
