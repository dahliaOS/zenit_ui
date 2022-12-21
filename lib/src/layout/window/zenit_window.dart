import 'package:window_manager/window_manager.dart';
import 'package:zenit_ui/zenit_ui.dart';

export 'package:window_manager/src/widgets/virtual_window_frame.dart';
export 'package:window_manager/src/window_listener.dart';
export 'package:window_manager/window_manager.dart' show WindowOptions, TitleBarStyle;
export 'package:zenit_ui/src/layout/window/zenit_titlebar.dart';
export 'package:zenit_ui/src/layout/window/zenit_window_frame.dart';

class ZenitWindow {
  WindowOptions? options;

  static Future<void> initialize({WindowOptions? options}) async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    windowManager.waitUntilReadyToShow(options, () async {
      await windowManager.show();
      await windowManager.focus();
      if (options?.titleBarStyle == TitleBarStyle.hidden) await windowManager.setAsFrameless();
    });
  }

  /// Closes the window.
  static Future<void> close() async => windowManager.close();

  /// Minimizes the window.
  static Future<void> minimize() async => windowManager.minimize();

  /// Maximizes the window.
  static Future<void> maximize() async => windowManager.maximize();

  /// Unmaximizes the window.
  static Future<void> unmaximize() async => windowManager.unmaximize();

  /// Returns true if the window is maximized.
  static Future<bool> isMaximized() async => windowManager.isMaximized();

  /// Toggles the maximized state of the window.
  static Future<void> toggleMaximize() async => await isMaximized() ? unmaximize() : maximize();

  /// Requests the window to be focused.
  static Future<void> focus() async => windowManager.focus();

  /// Hides the window.
  static Future<void> hide() async => windowManager.hide();

  /// Sets the window to be always on top.
  static Future<void> alwaysOnTop(bool isAlwaysOnTop) async => windowManager.setAlwaysOnTop(isAlwaysOnTop);

  /// Sets the window to be fullscreen.
  static Future<void> setFullscreen(bool isFullScreen) async => windowManager.setFullScreen(isFullScreen);

  /// Returns true of the window is in fullscreen mode.
  static Future<bool> isFullscreen() async => windowManager.isFullScreen();

  /// Sets the window to be fullscreen.
  static Future<void> toggleFullscreen() async => windowManager.setFullScreen(!await isFullscreen());

  /// Resizes and moves the window to the supplied bounds.
  static Future<void> setBounds(Rect bounds) async => windowManager.setBounds(bounds);

  /// Sets the window's minimum size.
  static Future<void> setMinSize(Size minimumSize) async => windowManager.setMinimumSize(minimumSize);

  /// Sets whether the window is resizable.
  static Future<void> setResizable(bool isResizable) async => windowManager.setResizable(isResizable);

  /// Sets whether the window is movable.
  static Future<void> setMovable(bool isMovable) async => windowManager.setMovable(isMovable);

  /// Returns the window title.
  static Future<String> getTitle() async => windowManager.getTitle();

  /// Sets the window's title.
  static Future<void> setTitle(String title) async => windowManager.setTitle(title);

  static WindowManager get instance => WindowManager.instance;
}
