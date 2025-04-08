//Credits: @HrX03 - for the base (which was slightly altered)

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/constants/constants.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final ZenitSwitchTheme? theme;

  const ZenitSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.theme,
  });

  @override
  State<ZenitSwitch> createState() => _ZenitSwitchState();
}

class _ZenitSwitchState extends State<ZenitSwitch> with TickerProviderStateMixin {
  late final AnimationController _positionController = AnimationController(
    vsync: this,
    duration: kDefaultAnimationDuration,
    value: widget.value ? 1 : 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ZenitSwitch old) {
    _positionController.animateTo(
      widget.value ? 1 : 0,
      curve: Curves.easeOut,
    );

    super.didUpdateWidget(old);
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final ZenitSwitchTheme switchTheme = widget.theme ?? ZenitTheme.switchTheme(context);
    final Color activeTrackColor = switchTheme.activeTrackColor;
    final Color inactiveTrackColor = switchTheme.inactiveTrackColor;
    final Color activeThumbColor = switchTheme.activeThumbColor;
    final Color inactiveThumbColor = switchTheme.inactiveThumbColor;
    final Color outlineColor = switchTheme.outlineColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          _positionController.value += details.primaryDelta! / 48;
        },
        onHorizontalDragEnd: (details) {
          widget.onChanged?.call(_positionController.value > 0.5);
        },
        onTap: () => widget.onChanged?.call(!widget.value),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedBuilder(
            animation: _positionController,
            builder: (context, child) => CustomPaint(
              painter: _SwitchPainter(
                value: widget.value,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                activeThumbColor: activeThumbColor,
                inactiveThumbColor: inactiveThumbColor,
                positionValue: _positionController.value,
                hover: hover,
                hoverColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                outlineColor: outlineColor,
              ),
              size: const Size(44, 24),
            ),
          ),
        ),
      ),
    );
  }
}

class _SwitchPainter extends CustomPainter {
  final bool value;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final Color activeThumbColor;
  final Color inactiveThumbColor;
  final double positionValue;
  final bool hover;
  final Color hoverColor;
  final Color outlineColor;

  const _SwitchPainter({
    required this.value,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.positionValue,
    required this.hover,
    required this.hoverColor,
    required this.outlineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const shape = StadiumBorder();
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: 44, height: 24);
    final trackPath = shape.getOuterPath(rect);

    final Paint trackPaint = Paint()
      ..color = value ? activeTrackColor : inactiveTrackColor
      ..style = PaintingStyle.fill;

    final Paint outlinePaint = Paint()
      ..color = value ? activeTrackColor : outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint thumbPaint = Paint()
      ..color = value ? activeThumbColor : inactiveThumbColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackPath, outlinePaint);

    final Offset thumbPosition = Offset(12 + (20 * positionValue), size.height / 2);

    if (hover) {
      final Paint hoverPaint = Paint()
        ..color = hoverColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(thumbPosition, 20, hoverPaint);
    }

    canvas.drawCircle(thumbPosition, size.height / 3, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant _SwitchPainter old) {
    return value != old.value ||
        positionValue != old.positionValue ||
        hover != old.hover ||
        outlineColor != old.outlineColor ||
        activeTrackColor != old.activeTrackColor ||
        inactiveTrackColor != old.inactiveTrackColor ||
        activeThumbColor != old.activeThumbColor ||
        inactiveThumbColor != old.inactiveThumbColor ||
        hoverColor != old.hoverColor;
  }
}
