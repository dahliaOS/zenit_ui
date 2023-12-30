import 'package:flutter/foundation.dart';
import 'package:yaru_window/yaru_window.dart';
import 'package:zenit_ui/src/window/titlebar_gesture_detector.dart';
import 'package:zenit_ui/zenit_ui.dart';

class ZenitWindowTitlebar extends StatefulWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Border? border;

  const ZenitWindowTitlebar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.border,
  });

  static Future<void> ensureInitialized() async {
    _windowStates.clear();
    await YaruWindow.ensureInitialized().then((window) => window.hideTitle());
  }

  static final _windowStates = <YaruWindowInstance, YaruWindowState>{};

  @override
  State<ZenitWindowTitlebar> createState() => _ZenitWindowTitlebarState();

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _ZenitWindowTitlebarState extends State<ZenitWindowTitlebar> {
  @override
  Widget build(BuildContext context) {
    final YaruWindowInstance window = YaruWindow.of(context);
    final zenitNavigatorMessenger = ZenitNavigatorMessenger.maybeOf(context);
    return StreamBuilder<YaruWindowState>(
      stream: window.states(),
      initialData: ZenitWindowTitlebar._windowStates[window],
      builder: (context, snapshot) {
        final state = snapshot.data;
        return TitleBarGestureDetector(
          onDrag: (data) async => window.drag(),
          onDoubleTap: () async {
            if ((state?.isMaximized ?? false) && (state?.isRestorable ?? false)) {
              await window.restore();
            } else if (!(state?.isMaximized ?? false) && (state?.isMaximizable ?? false)) {
              await window.maximize();
            }
          },
          onSecondaryTap: () async => window.showMenu(),
          child: ZenitWindowBackdropEffect(
            state: state,
            child: ZenitToolbar(
              border: widget.border,
              backgroundColor: widget.backgroundColor,
              leadingActions: (zenitNavigatorMessenger?.canPop ?? false)
                  ? [
                      const SizedBox(width: 6),
                      ZenitNavigatorMessengerHost(
                        child: Material(
                          type: MaterialType.transparency,
                          child: ZenitIconButton(
                            icon: Icons.chevron_left_rounded,
                            onPressed: () {
                              if (zenitNavigatorMessenger?.canPop ?? false) {
                                zenitNavigatorMessenger?.requestPopTransaction();
                              }
                            },
                            buttonSize: 36,
                          ),
                        ),
                      ),
                    ]
                  : [],
              trailingActions: [
                if (state?.isMinimizable ?? false)
                  ZenitWindowButton(
                    type: ZenitWindowButtonType.minimize,
                    onPressed: () async => window.minimize(),
                  ),
                const SizedBox(width: 4),
                if (!(state?.isMaximized ?? false) && (state?.isMaximizable ?? false))
                  ZenitWindowButton(
                    type: ZenitWindowButtonType.maximize,
                    onPressed: () async => window.maximize(),
                  ),
                if ((state?.isMaximized ?? false) && (state?.isRestorable ?? false))
                  ZenitWindowButton(
                    type: ZenitWindowButtonType.restore,
                    onPressed: () async => window.restore(),
                  ),
                const SizedBox(width: 4),
                ZenitWindowButton(
                  type: ZenitWindowButtonType.close,
                  onPressed: () async => window.close(),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ZenitWindowTitle extends StatelessWidget {
  const ZenitWindowTitle({
    super.key,
    this.fallback = "",
  });

  /// Fallback title if the window title is not available (eg. Web)
  final String fallback;

  static final _windowStates = <YaruWindowInstance, YaruWindowState>{};

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return Text(fallback);
    return Builder(
      builder: (context) {
        final YaruWindowInstance window = YaruWindow.of(context);
        return StreamBuilder<YaruWindowState>(
          stream: window.states(),
          initialData: _windowStates[window],
          builder: (context, snapshot) {
            final state = snapshot.data;
            return Text(state?.title ?? "");
          },
        );
      },
    );
  }
}
