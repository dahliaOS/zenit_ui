import 'dart:ui';

import 'package:window_manager/window_manager.dart';

// ignore: avoid_classes_with_only_static_members
class ZenitWindow {
  const ZenitWindow();

  static Future<void> setMinimumSize(Size size) async {
    await windowManager.setMinimumSize(size);
  }

  static Future<Size> get size async => windowManager.getSize();

  static Future<void> setMaximumSize(Size size) async {
    await windowManager.setMaximumSize(size);
  }

  static Future<void> setSize(Size size) async {
    await windowManager.setSize(size);
  }

  static Future<void> setAlwaysOnTop(bool value) async {
    await windowManager.setAlwaysOnTop(value);
  }

  static Future<void> setFullScreen(bool value) async {
    await windowManager.setFullScreen(value);
  }

  static Future<void> setIcon(String path) async {
    await windowManager.setIcon(path);
  }

  static Future<void> setAsFrameless() async {
    await windowManager.setAsFrameless();
  }

  static Future<void> show() async {
    await windowManager.show();
  }

  static Future<void> focus() async {
    await windowManager.focus();
  }

  static Future<void> close() async {
    await windowManager.close();
  }

  static Future<void> minimize() async {
    await windowManager.minimize();
  }

  static Future<void> maximize() async {
    await windowManager.maximize();
  }

  static Future<void> restore() async {
    await windowManager.restore();
  }

  static Future<void> setSkipTaskbar(bool value) async {
    await windowManager.setSkipTaskbar(value);
  }

  static Future<void> setTitleBarStyle(TitleBarStyle style) async {
    await windowManager.setTitleBarStyle(style);
  }

  static Future<void> setBackgroundColor(Color color) async {
    await windowManager.setBackgroundColor(color);
  }

  static Future<void> center() async {
    await windowManager.center();
  }

  static Future<void> setResizable(bool value) async {
    await windowManager.setResizable(value);
  }

  static Future<void> setMovable(bool value) async {
    await windowManager.setMovable(value);
  }

  static Future<void> setMinimizable(bool value) async {
    await windowManager.setMinimizable(value);
  }

  static Future<void> setMaximizable(bool value) async {
    await windowManager.setMaximizable(value);
  }

  static Future<void> setClosable(bool value) async {
    await windowManager.setClosable(value);
  }
}
