import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitIconButton extends StatefulWidget {
  const ZenitIconButton({
    super.key,
    required this.icon,
    this.hoverColor,
    this.onPressed,
    this.borderRadius = kDefaultBorderRadiusMedium,
  });

  final IconData? icon;

  final Color? hoverColor;

  final VoidCallback? onPressed;

  final BorderRadius borderRadius;

  @override
  State<ZenitIconButton> createState() => ZenitIconButtonState();
}

class ZenitIconButtonState extends State<ZenitIconButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    )..addListener(
        () => setState(() {}),
      );
    super.initState();
  }

  Color backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return TickAnimator(
      onPressed: widget.onPressed,
      borderRadius: widget.borderRadius,
      child: PhysicalModel(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            widget.icon,
          ),
        ),
      ),
    );
  }

  void handleHover(dynamic event) {
    if (event is PointerEnterEvent) {
      setState(() {
        backgroundColor = widget.hoverColor ?? Theme.of(context).colorScheme.surface;
      });
    } else {
      setState(() {
        backgroundColor = Colors.transparent;
      });
    }
  }
}
