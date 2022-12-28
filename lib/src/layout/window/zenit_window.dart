import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
import 'package:zenit_ui/zenit_ui.dart';

export 'package:window_manager/src/widgets/virtual_window_frame.dart';
export 'package:window_manager/src/window_listener.dart';
export 'package:window_manager/window_manager.dart' show WindowOptions, TitleBarStyle;
export 'package:zenit_ui/src/layout/window/zenit_titlebar.dart';

class ZenitWindow {
  WindowOptions? options;

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      await windowManager.ensureInitialized();
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    }
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
