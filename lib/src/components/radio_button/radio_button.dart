import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitRadioButton<T> extends StatefulWidget {
  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final ZenitRadioButtonTheme? theme;
  const ZenitRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.theme,
  });

  @override
  State<ZenitRadioButton<T>> createState() => _ZenitRadioButtonState<T>();
}

class _ZenitRadioButtonState<T> extends State<ZenitRadioButton<T>> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: kDefaultAnimationDuration,
      vsync: this,
      value: widget.value == widget.groupValue ? 1 : 0,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void didUpdateWidget(covariant ZenitRadioButton<T> oldWidget) {
    controller.animateTo(widget.value == widget.groupValue ? 1 : 0, curve: Curves.easeOut);
    if (widget == oldWidget) return;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? ZenitTheme.radioButtonTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final thumbColor = theme.thumbColor;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onChanged?.call(widget.value),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return CustomPaint(
              painter: _RadioPainter(
                selected: widget.value == widget.groupValue,
                activeBackgroundColor: activeBackgroundColor,
                inactiveBackgroundColor: inactiveBackgroundColor,
                thumbColor: thumbColor,
                animationValue: animation.value,
              ),
              size: const Size.square(24),
            );
          },
        ),
      ),
    );
  }
}

class _RadioPainter extends CustomPainter {
  final bool selected;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color thumbColor;

  final double animationValue;

  const _RadioPainter({
    required this.selected,
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.thumbColor,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = selected ? activeBackgroundColor : inactiveBackgroundColor
      ..style = PaintingStyle.fill;

    final Paint thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(center, 12, backgroundPaint);
    if (animationValue != 0) {
      canvas.drawCircle(center, animationValue * 7, thumbPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _RadioPainter old) {
    return selected != old.selected || animationValue != old.animationValue;
  }
}
