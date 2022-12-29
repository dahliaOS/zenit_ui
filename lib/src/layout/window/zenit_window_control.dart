import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';

const _kWindowControlHoverOpacity = 0.2;
const _kWindowControlSize = 28.0;
const _kWindowControlIconSize = 16.0;

class ZenitWindowControl extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ZenitWindowControl({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<ZenitWindowControl> createState() => _ZenitWindowControlState();
}

class _ZenitWindowControlState extends State<ZenitWindowControl> {
  @override
  void initState() {
    super.initState();
  }

  bool _hover = false;

  bool get hover => _hover;

  IconData get icon => widget.icon;

  VoidCallback get onPressed => widget.onPressed;

  void _onHover(bool hover) {
    setState(() {
      _hover = hover;
    });
  }

  Color _getColor(BuildContext context) {
    final theme = ZenitTheme.of(context);
    if (!hover) {
      return theme.surfaceColor;
    } else {
      return Color.alphaBlend(
        theme.foregroundColor.withOpacity(_kWindowControlHoverOpacity),
        theme.surfaceColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getColor(context),
          ),
          child: SizedBox.square(
            dimension: _kWindowControlSize,
            child: Center(
              child: Icon(
                icon,
                size: _kWindowControlIconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ZenitWindowControlRow extends StatelessWidget {
  const ZenitWindowControlRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ZenitWindowControl(
          icon: Icons.minimize,
          onPressed: () async => ZenitWindow.minimize(),
        ),
        const Gap(8),
        ZenitWindowControl(
          icon: Icons.crop_square_rounded,
          onPressed: () async => ZenitWindow.toggleMaximize(),
        ),
        const Gap(8),
        ZenitWindowControl(
          icon: Icons.close,
          onPressed: () async => ZenitWindow.close(),
        ),
      ],
    );
  }
}
