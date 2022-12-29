import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitPillIcon extends StatelessWidget {
  const ZenitPillIcon({
    super.key,
    this.selected = false,
    required this.child,
  });

  final bool selected;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final zenitTheme = ZenitTheme.of(context);
    return SizedBox(
      width: 52,
      height: 28,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? zenitTheme.primaryColor : Colors.transparent,
          borderRadius: kDefaultBorderRadiusBig,
        ),
        child: IconTheme(
          data: IconTheme.of(context).copyWith(
            color: selected ? zenitTheme.backgroundColor : null,
          ),
          child: child ?? const SizedBox(),
        ),
      ),
    );
  }
}
