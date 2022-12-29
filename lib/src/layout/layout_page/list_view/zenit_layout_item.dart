import 'package:flutter/material.dart';

class ZenitLayoutItem {
  const ZenitLayoutItem({
    required this.titleBuilder,
    required this.pageBuilder,
    required this.iconBuilder,
  });

  final WidgetBuilder titleBuilder;
  final WidgetBuilder pageBuilder;
  final Widget Function(BuildContext context, bool selected) iconBuilder;
}
