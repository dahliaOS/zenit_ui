import 'package:window_manager/window_manager.dart';
import 'package:zenit_ui/zenit_ui.dart';

import '../../src/window/window_properties.dart';

Future<void> initializeZenitWindow(WindowProperties p) async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final WindowOptions windowOptions = WindowOptions(
    size: p.size,
    center: p.center,
    backgroundColor: p.backgroundColor,
    skipTaskbar: p.skipTaskbar,
    titleBarStyle: p.titleBarStyle,
    minimumSize: p.minimumSize,
    maximumSize: p.maximumSize,
    alwaysOnTop: p.alwaysOnTop,
    fullScreen: p.fullscreen,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    if (p.iconPath != null) {
      await windowManager.setIcon(p.iconPath!);
    }
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });
}
