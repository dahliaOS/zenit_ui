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
  _ZenitSwitchState createState() => _ZenitSwitchState();
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
                hoverColor: Theme.of(context).foregroundColor.withOpacity(0.05),
              ),
              size: const Size(48, 24),
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

  const _SwitchPainter({
    required this.value,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.activeThumbColor,
    required this.inactiveThumbColor,
    required this.positionValue,
    required this.hover,
    required this.hoverColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const shape = RoundedRectangleBorder(borderRadius: kDefaultBorderRadiusBig);
    final rect = Offset.zero & size;
    final trackPath = shape.getOuterPath(rect);

    final Paint trackPaint = Paint()
      ..color = value ? activeTrackColor : inactiveTrackColor
      ..style = PaintingStyle.fill;

    final Paint thumbPaint = Paint()
      ..color = value ? activeThumbColor : inactiveThumbColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(trackPath, trackPaint);

    final Offset thumbPosition = Offset(12 + (24 * positionValue), size.height / 2);

    if (hover) {
      final Paint hoverPaint = Paint()
        ..color = hoverColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(thumbPosition, 20, hoverPaint);
    }

    canvas.drawCircle(thumbPosition, 8, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant _SwitchPainter old) {
    return value != old.value || positionValue != old.positionValue || hover != old.hover;
  }
}
