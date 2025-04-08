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
    controller.animateTo(
      widget.value == widget.groupValue ? 1 : 0,
      curve: Curves.easeOut,
    );
    if (widget == oldWidget) return;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? ZenitTheme.radioButtonTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final thumbColor = theme.thumbColor;
    final outlineColor = theme.outlineColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: () => widget.onChanged?.call(widget.value),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
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
                  hover: hover,
                  hoverColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                  outlineColor: outlineColor,
                ),
                size: const Size.square(32),
              );
            },
          ),
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
  final bool hover;
  final Color hoverColor;
  final Color outlineColor;

  final double animationValue;

  const _RadioPainter({
    required this.selected,
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.thumbColor,
    required this.animationValue,
    required this.hover,
    required this.hoverColor,
    required this.outlineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = selected ? activeBackgroundColor : inactiveBackgroundColor
      ..style = PaintingStyle.fill;

    final Paint outlinePaint = Paint()
      ..color = selected ? activeBackgroundColor : outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.height / 2, size.width / 2);

    // Draw Background
    canvas.drawCircle(center, 12, backgroundPaint);
    canvas.drawCircle(center, 12, outlinePaint);

    // Draw hover
    if (hover) {
      final hoverPaint = Paint()
        ..color = hoverColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, 20, hoverPaint);
    }

    // Draw thumb
    if (animationValue != 0) {
      canvas.drawCircle(center, animationValue * 6, thumbPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _RadioPainter old) {
    return selected != old.selected ||
        animationValue != old.animationValue ||
        hover != old.hover ||
        hoverColor != old.hoverColor ||
        outlineColor != old.outlineColor ||
        activeBackgroundColor != old.activeBackgroundColor ||
        inactiveBackgroundColor != old.inactiveBackgroundColor ||
        thumbColor != old.thumbColor;
  }
}
