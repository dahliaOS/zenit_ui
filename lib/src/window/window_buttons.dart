import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 300);

enum ZenitWindowButtonType { close, maximize, minimize, restore }

class ZenitWindowButton extends StatefulWidget {
  final ZenitWindowButtonType type;
  final VoidCallback? onPressed;
  const ZenitWindowButton({
    super.key,
    required this.type,
    this.onPressed,
  });

  @override
  State<ZenitWindowButton> createState() => _ZenitWindowButtonState();
}

class _ZenitWindowButtonState extends State<ZenitWindowButton> {
  bool hover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: RepaintBoundary(
              child: CustomPaint(
                size: const Size(32, 32),
                painter: _ZenitWindowButtonPainter(
                  type: widget.type,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  hover: hover,
                  darkMode: Theme.of(context).brightness == Brightness.dark,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ZenitWindowButtonPainter extends CustomPainter {
  final ZenitWindowButtonType type;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool hover;
  final bool darkMode;

  const _ZenitWindowButtonPainter({
    required this.type,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.hover,
    required this.darkMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /* final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill; */

    final Paint foregroundPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final Paint hoverPaint = Paint()
      ..color = foregroundColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final Offset center = Offset(size.height / 2, size.width / 2);

    final Rect buttonRect = Rect.fromCenter(
      center: center,
      width: size.width * 0.3,
      height: size.height * 0.3,
    );

    /* canvas.drawCircle(center, 16, backgroundPaint); */

    if (hover) {
      canvas.drawCircle(center, 16, hoverPaint);
    }

    switch (type) {
      case ZenitWindowButtonType.close:
        drawClose(canvas, buttonRect, foregroundPaint);
      case ZenitWindowButtonType.maximize:
        drawMaximize(canvas, buttonRect, foregroundPaint, foregroundColor);
      case ZenitWindowButtonType.restore:
        drawRestore(canvas, buttonRect, foregroundPaint, foregroundColor);
      case ZenitWindowButtonType.minimize:
        drawMinimize(canvas, buttonRect, foregroundPaint);
      default:
        drawClose(canvas, buttonRect, foregroundPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ZenitWindowButtonPainter old) {
    return old.hover != hover ||
        old.darkMode != darkMode ||
        old.foregroundColor != foregroundColor ||
        old.backgroundColor != backgroundColor ||
        old.type != type;
  }
}

void drawClose(Canvas canvas, Rect buttonRect, Paint foregroundPaint) {
  canvas.drawLine(buttonRect.topLeft, buttonRect.bottomRight, foregroundPaint);
  canvas.drawLine(buttonRect.topRight, buttonRect.bottomLeft, foregroundPaint);
}

void drawRestoreMaximize(
  Canvas canvas,
  bool maximized,
  Rect buttonRect,
  Paint foregroundPaint,
  Color foregroundColor,
) {
  const gap = 2;
  final max = maximized ? 0 : 1;

  final rect = Rect.fromLTRB(
    buttonRect.left,
    buttonRect.top + gap * max,
    buttonRect.right - gap * max,
    buttonRect.bottom,
  );

  final path = Path()
    ..moveTo(
      buttonRect.topLeft.dx + (1 + 0.5),
      buttonRect.topLeft.dy,
    )
    ..lineTo(
      buttonRect.topRight.dx,
      buttonRect.topRight.dy,
    )
    ..lineTo(
      buttonRect.bottomRight.dx,
      buttonRect.bottomRight.dy - (1 + 0.5),
    );

  canvas.drawRect(rect, foregroundPaint);
  canvas.drawPath(
    path,
    foregroundPaint..color = foregroundColor.withOpacity(0.5 * max),
  );
}

void drawRestore(Canvas canvas, Rect buttonRect, Paint foregroundPaint, Color foregroundColor) =>
    drawRestoreMaximize(canvas, false, buttonRect, foregroundPaint, foregroundColor);

void drawMaximize(Canvas canvas, Rect buttonRect, Paint foregroundPaint, Color foregroundColor) =>
    drawRestoreMaximize(canvas, true, buttonRect, foregroundPaint, foregroundColor);

void drawMinimize(Canvas canvas, Rect buttonRect, Paint foregroundPaint) {
  canvas.drawLine(
    Offset(buttonRect.bottomLeft.dx, buttonRect.bottomLeft.dy - 1.0),
    Offset(buttonRect.bottomRight.dx, buttonRect.bottomRight.dy - 1.0),
    foregroundPaint,
  );
}
