import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitIconButton extends StatelessWidget {
  const ZenitIconButton({
    super.key,
    required this.icon,
    this.hoverColor,
    this.onPressed,
    this.borderRadius = kDefaultBorderRadiusExtraLarge,
    this.buttonSize = 40,
    this.iconSize = 20,
  });

  final IconData? icon;

  final Color? hoverColor;

  final VoidCallback? onPressed;

  final BorderRadius borderRadius;

  final double buttonSize;

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      hoverColor: hoverColor,
      child: SizedBox.square(
        dimension: buttonSize,
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
