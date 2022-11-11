import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
import 'package:zenit_ui/zenit_ui.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onSecondaryTap: () async => windowManager.popUpWindowMenu(),
      onDoubleTap: () async => windowManager.toggleMaximize(),
      onPanStart: (details) async {
        await windowManager.startDragging();
      },
      child: AppBar(
        title: const Text("Zenit UI Responsive Platform"),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          titlebarButton(
            Icons.minimize,
            () async => windowManager.minimize(),
            context,
          ),
          titlebarButton(
            Icons.crop_square,
            () async => windowManager.toggleMaximize(),
            context,
          ),
          titlebarButton(
            Icons.close,
            () async => windowManager.close(),
            context,
          ),
          const Gap(6),
        ],
      ),
    );
  }

  Widget titlebarButton(
    IconData icon,
    VoidCallback onPressed,
    BuildContext context,
  ) {
    final theme = ZenitTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        maxRadius: 16,
        minRadius: 16,
        child: Material(
          color: Color.alphaBlend(theme.foregroundColor.withOpacity(0.08), theme.surfaceColor),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: kIsWeb ? null : onPressed,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                size: 16,
                color: theme.foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(46);
}

extension on WindowManager {
  Future<void> toggleMaximize() async {
    await isMaximized() ? await unmaximize() : await maximize();
  }
}
