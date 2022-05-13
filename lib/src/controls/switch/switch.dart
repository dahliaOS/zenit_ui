
//Credits: @HrX03 - for the base (which was slightly altered)

import 'package:flutter/material.dart';

class Switch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const Switch({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Switch> with TickerProviderStateMixin {
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
  void didUpdateWidget(covariant Switch old) {
    _positionController.animateTo(
      widget.value ? 1 : 0,
      curve: Curves.easeOut,
    );

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    const Color activeTrackColor = Colors.red;
    final Color inactiveTrackColor = Colors.grey[700]!;
    const Color thumbColor = Colors.white;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onChanged?.call(!widget.value);
        },
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
                    alignment:
                        _thumbPositionTween.evaluate(_positionController)!,
                    child: child,
                  );
                },
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: thumbColor,
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
