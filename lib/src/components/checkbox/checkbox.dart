import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitCheckbox extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final ZenitCheckboxTheme? theme;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool tristate;
  const ZenitCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.theme,
    this.focusNode,
    this.autofocus = false,
    this.tristate = false,
  }) : assert(tristate || value != null);

  @override
  State<ZenitCheckbox> createState() => _ZenitCheckboxState();
}

class _ZenitCheckboxState extends State<ZenitCheckbox> with TickerProviderStateMixin {
  late AnimationController checkmarkController;
  late AnimationController dashController;

  @override
  void initState() {
    super.initState();
    checkmarkController = AnimationController(
      vsync: this,
      duration: kDefaultAnimationDuration,
      value: 1,
    );
    dashController = AnimationController(
      vsync: this,
      duration: kDefaultAnimationDuration,
      value: 1,
    );
  }

  @override
  void dispose() {
    checkmarkController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ZenitCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget == oldWidget) return;
    checkmarkController.animateTo(
      switch (widget.value) {
        true => 1,
        false || null => 0,
      },
    );
    dashController.animateTo(
      switch (widget.value) {
        null => 1,
        true || false => 0,
      },
    );
  }

  void handleTap() {
    if (widget.onChanged == null) return;
    switch (widget.value) {
      case false:
        widget.onChanged!(true);
      case true:
        widget.onChanged!(widget.tristate ? null : false);
      case null:
        widget.onChanged!(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? ZenitTheme.checkboxTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final foregroundColor = theme.foregroundColor;
    final curvedCheckmark = CurvedAnimation(parent: checkmarkController, curve: Curves.easeOut);
    final curvedDash = CurvedAnimation(parent: dashController, curve: Curves.easeOut);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: handleTap,
        child: AnimatedBuilder(
          animation: Listenable.merge([checkmarkController, dashController]),
          builder: (context, child) => CustomPaint(
            painter: _CheckboxPainter(
              value: widget.value,
              activeBackgroundColor: activeBackgroundColor,
              inactiveBackgroundColor: inactiveBackgroundColor,
              foregroundColor: foregroundColor,
              checkmarkAnimationValue: curvedCheckmark.value,
              dashAnimationValue: curvedDash.value,
            ),
            size: const Size.square(24),
          ),
        ),
      ),
    );
  }
}

class _CheckboxPainter extends CustomPainter {
  final bool? value;
  final Color activeBackgroundColor;
  final Color inactiveBackgroundColor;
  final Color foregroundColor;
  final double checkmarkAnimationValue;
  final double dashAnimationValue;

  const _CheckboxPainter({
    required this.value,
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.foregroundColor,
    required this.checkmarkAnimationValue,
    required this.dashAnimationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const shape = RoundedRectangleBorder(borderRadius: kDefaultBorderRadiusMedium);
    final rect = Offset.zero & size;
    final bgPath = shape.getOuterPath(rect);
    final backgroundPaint = Paint()
      ..color = value != false ? activeBackgroundColor : inactiveBackgroundColor
      ..style = PaintingStyle.fill;

    final Paint foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(bgPath, backgroundPaint);
    switch (value) {
      case true:
        final checkmarkPath = Path()
          ..moveTo(size.width * 0.279166667, size.height * 0.511250000)
          ..lineTo(size.width * 0.416666667, size.height * 0.638333333)
          ..lineTo(size.width * 0.720833333, size.height * 0.344583333);
        final checkmarkMetrics = checkmarkPath.computeMetrics().first;
        canvas.drawPath(
          checkmarkMetrics.extractPath(0, checkmarkAnimationValue * checkmarkMetrics.length),
          foregroundPaint,
        );
      case false:
        break;
      case null:
        final dashPath = Path()
          ..moveTo(size.width * 0.3, size.height * 0.5)
          ..lineTo(size.width * 0.7, size.height * 0.5);

        final dashMetrics = dashPath.computeMetrics().first;
        canvas.drawPath(dashMetrics.extractPath(0, dashAnimationValue * dashMetrics.length), foregroundPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CheckboxPainter old) {
    return value != old.value || checkmarkAnimationValue != old.checkmarkAnimationValue;
  }
}
