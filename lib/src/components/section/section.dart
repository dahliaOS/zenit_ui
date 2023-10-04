import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitSection extends StatelessWidget {
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;

  const ZenitSection({
    super.key,
    this.color,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: color ?? Theme.of(context).colorScheme.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? kCardBorderRadius,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
          ),
        ),
        child: child,
      ),
    );
  }
}
