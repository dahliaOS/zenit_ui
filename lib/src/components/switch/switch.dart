//Credits: @HrX03 - for the base (which was slightly altered)

import 'package:flutter/material.dart';
import 'package:zenit_ui/src/base/tick_animator.dart';
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
    duration: const Duration(milliseconds: 150),
    value: widget.value ? 1 : 0,
  );
  final AlignmentGeometryTween _thumbPositionTween = AlignmentGeometryTween(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
  );
  //Set<MaterialState> get _states => {if (widget.value) MaterialState.selected};

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
  Widget build(BuildContext context) {
    final ZenitSwitchTheme switchTheme = widget.theme ?? ZenitTheme.switchTheme(context);
    final Color activeTrackColor = switchTheme.activeTrackColor;
    final Color inactiveTrackColor = switchTheme.inactiveTrackColor;
    final Color activeThumbColor = switchTheme.activeThumbColor;
    final Color inactiveThumbColor = switchTheme.inactiveThumbColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TickAnimator(
        borderRadius: BorderRadius.circular(24),
        onPressed: () {
          widget.onChanged?.call(!widget.value);
        },
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            _positionController.value += details.primaryDelta! / 48;
          },
          onHorizontalDragEnd: (details) {
            widget.onChanged?.call(_positionController.value > 0.5);
          },
          child: SizedBox(
            width: 48,
            height: 24,
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: widget.value ? activeTrackColor : inactiveTrackColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: AnimatedBuilder(
                  animation: _positionController,
                  builder: (context, child) {
                    return Align(
                      alignment: _thumbPositionTween.evaluate(_positionController)!,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: widget.value ? activeThumbColor : inactiveThumbColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
