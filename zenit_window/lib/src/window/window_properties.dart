import 'package:window_manager/window_manager.dart';
import 'package:zenit_ui/zenit_ui.dart';

/// Define properties for the window_manager plugin to apply to the ZenitUI Window

class WindowProperties {
  final bool? skipTaskbar;
  final String? iconPath;
  final TitleBarStyle? titleBarStyle;
  final Color? backgroundColor;
  final Size? size;
  final Size? minimumSize;
  final Size? maximumSize;
  final bool? center;
  final bool? alwaysOnTop;
  final bool? fullscreen;

  const WindowProperties({
    this.skipTaskbar = false,
    this.iconPath,
    this.titleBarStyle = TitleBarStyle.hidden,
    this.backgroundColor = Colors.transparent,
    this.size = const Size(800, 600),
    this.minimumSize = const Size(400, 200),
    this.maximumSize = const Size(1920, 1080),
    this.center = true,
    this.alwaysOnTop = false,
    this.fullscreen = false,
  });
}
