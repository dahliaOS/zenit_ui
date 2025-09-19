import "package:flutter/material.dart";

class WindowBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Widget> leftWidgets;
  final List<Widget> centerWidgets;
  final List<Widget> rightWidgets;
  final GestureDetector gestureDetector;

  const WindowBar({
    super.key,
    this.height = 40,
    this.leftWidgets = const [],
    this.centerWidgets = const [],
    this.rightWidgets = const [],
    required this.gestureDetector,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        height: height,
        color: Colors.grey[200],
        child: Row(
          children: [
            // Left section
            Row(
              children: leftWidgets,
            ),
            // Center section
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: centerWidgets,
                ),
              ),
            ),
            // Right section
            Row(
              children: rightWidgets,
            ),
          ],
        ),
      );
    });
  }
}
