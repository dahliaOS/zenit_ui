import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
import 'package:zenit_ui/src/constants/constants.dart';

class ZenitOptionButton extends StatefulWidget {
  const ZenitOptionButton({
    super.key,
    required this.child,
    this.hoverColor,
    this.onPressed,
    this.borderRadius = kDefaultBorderRadiusMedium,
  });

  final Widget? child;

  final Color? hoverColor;

  final VoidCallback? onPressed;

  final BorderRadius borderRadius;

  @override
  State<ZenitOptionButton> createState() => ZenitOptionButtonState();
}

class ZenitOptionButtonState extends State<ZenitOptionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  Color backgroundColor = Colors.transparent;

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
          child: widget.child,
        ),
      ),
    );
  }
}
