import 'package:flutter/material.dart' as m;
import 'package:zenit_ui/zenit_ui.dart';

class Colors implements m.Colors {
  static const Color blue = Color(0xFF0073cf);

  static const _MaterialColors materialColors = _MaterialColors();
}

//Implementation for Material-Colors as MaterialColors instead of Colors
typedef MaterialColors = m.Colors;

//Implementation for Material-Colors as Colors.materialColors instead of Colors
class _MaterialColors {
  m.MaterialColor get blue => m.Colors.blue;
  m.MaterialColor get lightBlue => m.Colors.lightBlue;
  m.MaterialColor get red => m.Colors.red;
  m.MaterialColor get green => m.Colors.green;
  m.MaterialColor get lightGreen => m.Colors.lightGreen;
  m.MaterialColor get lime => m.Colors.lime;
  m.MaterialColor get yellow => m.Colors.yellow;
  m.MaterialColor get orange => m.Colors.orange;
  m.MaterialColor get deepOrange => m.Colors.deepOrange;
  m.MaterialColor get purple => m.Colors.purple;
  m.MaterialColor get deepPurple => m.Colors.deepPurple;
  m.MaterialColor get indigo => m.Colors.indigo;
  m.MaterialColor get pink => m.Colors.pink;
  m.MaterialColor get cyan => m.Colors.cyan;
  m.MaterialColor get teal => m.Colors.teal;
  m.MaterialColor get brown => m.Colors.brown;
  m.MaterialColor get grey => m.Colors.grey;
  m.MaterialColor get amber => m.Colors.amber;
  m.Color get black => m.Colors.black;
  m.Color get white => m.Colors.white;

  const _MaterialColors();
}
