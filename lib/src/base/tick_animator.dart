import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/zenit_ui.dart';

class TickAnimator extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final BorderRadius? borderRadius;
  final Duration duration;
  final double multiplier;

  const TickAnimator({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.duration = kDefaultAnimationDuration,
    this.multiplier = 0.95,
  }) : assert(multiplier > 0 && multiplier < 1);

  @override
  State<TickAnimator> createState() => _TickAnimatorState();
}

//TODO possibly integrate PhysicalModel into this or make sure it's not needed
class _TickAnimatorState extends State<TickAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    animation = Tween<double>(begin: 1.0, end: widget.multiplier).animate(
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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: animation.value,
      child: InkWell(
        onTap: callbackAnimationHandler(
          widget.onPressed,
          animationController,
          widget.duration ~/ 2,
        ),
        borderRadius: widget.borderRadius,
        child: widget.child,
      ),
    );
  }
}

Function()? callbackAnimationHandler(
  VoidCallback? callback,
  AnimationController controller,
  Duration duration,
) {
  if (callback.isNull) {
    return null;
  } else {
    return () async {
      controller.forward();
      callback!();
      await Future.delayed(duration, () => controller.reverse());
    };
  }
}
