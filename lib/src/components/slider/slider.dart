import 'package:flutter/material.dart';
import 'package:zenit_ui/src/theme/theme.dart';

class ZenitSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  final Color? activeColor;
  final int? divisions;
  final Color? trackColor;
  final MouseCursor? mouseCursor;
  final Color? thumbColor;

  const ZenitSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.divisions,
    this.trackColor,
    this.mouseCursor,
    this.thumbColor,
  }) : assert(
          value >= 0.0 && value <= 1.0 && divisions == null ||
              divisions != null && divisions > 0 && divisions <= 100,
        );

  @override
  State<ZenitSlider> createState() => _ZenitSliderState();
}

class _ZenitSliderState extends State<ZenitSlider> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final sliderTheme = ZenitTheme.sliderTheme(context);
    double newValue = widget.value;
    final double divident = 1 / (widget.divisions ?? 1);
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: widget.mouseCursor ?? SystemMouseCursors.click,
          onEnter: (_) => setState(() => hover = true),
          onExit: (_) => setState(() => hover = false),
          child: Listener(
            onPointerPanZoomStart: (details) {
              newValue = details.localPosition.dx / (constraints.maxWidth);
              if (widget.divisions != null) newValue = (newValue / divident).round() * divident;
              if (newValue >= 0.0 && newValue <= 1.0) widget.onChanged(newValue);
            },
            child: GestureDetector(
              onTapDown: (details) {
                newValue = details.localPosition.dx / (constraints.maxWidth);
                if (widget.divisions != null) newValue = (newValue / divident).round() * divident;
                if (newValue >= 0.0 && newValue <= 1.0) widget.onChanged(newValue);
              },
              onHorizontalDragUpdate: (details) {
                newValue = details.localPosition.dx / (constraints.maxWidth);
                if (widget.divisions != null) newValue = (newValue / divident).round() * divident;
                if (newValue >= 0.0 && newValue <= 1.0) widget.onChanged(newValue);
              },
              child: CustomPaint(
                painter: _SliderPainter(
                  trackColor: widget.trackColor ?? sliderTheme.trackColor,
                  activeColor: widget.activeColor ?? sliderTheme.activeTrackColor,
                  thumbColor: widget.thumbColor ?? sliderTheme.thumbColor,
                  hover: hover,
                  hoverColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                  outlineColor: sliderTheme.outlineColor,
                  value: widget.value,
                  divisions: widget.divisions,
                ),
                size: Size(constraints.maxWidth, 48),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliderPainter extends CustomPainter {
  final Color trackColor;
  final Color activeColor;
  final double value;
  final bool hover;
  final Color hoverColor;
  final Color thumbColor;
  final Color outlineColor;
  final int? divisions;

  _SliderPainter({
    required this.trackColor,
    required this.activeColor,
    required this.value,
    required this.hover,
    required this.hoverColor,
    required this.thumbColor,
    required this.outlineColor,
    this.divisions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.fill;

    final Paint activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;

    final Paint thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final Paint outlinePaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint dividerPaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.fill;

    double activeWidth() {
      if (size.width * value >= size.width) {
        return size.width;
      } else if (size.width * value < 24) {
        return 24;
      } else {
        return size.width * value + 12;
      }
    }

    double thumbPositionX() {
      if (size.width * value >= size.width) {
        return size.width - 12;
      } else if (size.width * value < 24) {
        return 12;
      } else {
        return size.width * value;
      }
    }

    const kTrackBorderRadius = Radius.circular(12.0);

    final RRect track = RRect.fromLTRBR(0.0, 12.0, size.width, size.height - 12, kTrackBorderRadius);
    final RRect active = RRect.fromLTRBR(0.0, 12.0, activeWidth(), size.height - 12.0, kTrackBorderRadius);

    final Offset thumbPosition = Offset(thumbPositionX(), size.height / 2);

    canvas.drawRRect(track, trackPaint);
    canvas.drawRRect(track, outlinePaint);

    canvas.drawRRect(active, activePaint);

    final int divisions = this.divisions ?? 1;
    for (int i = 0; i < divisions - 1; i++) {
      final double x = (size.width / divisions) * i + (size.width / divisions);
      final Offset position = Offset(x, size.height / 2);
      canvas.drawCircle(position, 2, dividerPaint);
    }

    if (hover) {
      final Paint hoverPaint = Paint()
        ..color = hoverColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(thumbPosition, 20, hoverPaint);
    }

    canvas.drawCircle(thumbPosition, (size.height - 24) / 3, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant _SliderPainter old) {
    return old.value != value ||
        old.activeColor != activeColor ||
        old.trackColor != trackColor ||
        old.hover != hover ||
        old.hoverColor != hoverColor ||
        old.thumbColor != thumbColor ||
        old.outlineColor != outlineColor ||
        old.divisions != divisions;
  }
}
