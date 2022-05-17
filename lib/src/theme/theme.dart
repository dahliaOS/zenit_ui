// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';

typedef MaterialThemeData = m.ThemeData;

typedef MaterialTheme = m.Theme;

class Theme {
  late BuildContext context;
  Theme.of(this.context);

  MaterialThemeData get materialTheme => m.Theme.of(context);

  Color get primaryColor => materialTheme.primaryColor;
}
