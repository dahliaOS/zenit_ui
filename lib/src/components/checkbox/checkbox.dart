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

  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? ZenitTheme.checkboxTheme(context);
    final activeBackgroundColor = theme.activeBackgroundColor;
    final inactiveBackgroundColor = theme.inactiveBackgroundColor;
    final foregroundColor = theme.foregroundColor;
    final curvedCheckmark = CurvedAnimation(parent: checkmarkController, curve: Curves.easeOut);
    final curvedDash = CurvedAnimation(parent: dashController, curve: Curves.easeOut);
    final outlineColor = theme.outlineColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: handleTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
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
                outlineColor: outlineColor,
                hover: hover,
                hoverColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
              ),
              size: const Size.square(32),
            ),
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
  final bool hover;
  final Color hoverColor;
  final Color outlineColor;

  const _CheckboxPainter({
    required this.value,
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.foregroundColor,
    required this.checkmarkAnimationValue,
    required this.dashAnimationValue,
    required this.hover,
    required this.hoverColor,
    required this.outlineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const shape = RoundedRectangleBorder(borderRadius: kDefaultBorderRadiusSmall);
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: 24, height: 24);
    final bgPath = shape.getOuterPath(rect);
    final backgroundPaint = Paint()
      ..color = value != false ? activeBackgroundColor : inactiveBackgroundColor
      ..style = PaintingStyle.fill;

    final Paint outlinePaint = Paint()
      ..color = value == true ? activeBackgroundColor : outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(bgPath, backgroundPaint);
    canvas.drawPath(bgPath, outlinePaint);

    if (hover) {
      final hoverPaint = Paint()
        ..color = hoverColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        center,
        20,
        hoverPaint,
      );
    }

    switch (value) {
      case true:
        final checkmarkPath = Path()
          ..moveTo(size.width * 0.33437500, size.width * 0.50843750)
          ..lineTo(size.width * 0.43750000, size.width * 0.60375000)
          ..lineTo(size.width * 0.66562500, size.width * 0.38343750);
        final checkmarkMetrics = checkmarkPath.computeMetrics().first;
        canvas.drawPath(
          checkmarkMetrics.extractPath(
            0,
            checkmarkAnimationValue * checkmarkMetrics.length,
          ),
          foregroundPaint,
        );
      case false:
        break;
      case null:
        final dashPath = Path()
          ..moveTo(size.width * 0.35, size.height * 0.5)
          ..lineTo(size.width * 0.65, size.height * 0.5);

        final dashMetrics = dashPath.computeMetrics().first;
        canvas.drawPath(
          dashMetrics.extractPath(0, dashAnimationValue * dashMetrics.length),
          foregroundPaint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _CheckboxPainter old) {
    return value != old.value ||
        checkmarkAnimationValue != old.checkmarkAnimationValue ||
        hover != old.hover ||
        dashAnimationValue != old.dashAnimationValue ||
        hoverColor != old.hoverColor ||
        outlineColor != old.outlineColor ||
        activeBackgroundColor != old.activeBackgroundColor ||
        inactiveBackgroundColor != old.inactiveBackgroundColor ||
        foregroundColor != old.foregroundColor;
  }
}
