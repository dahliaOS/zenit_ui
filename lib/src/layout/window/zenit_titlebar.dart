import 'package:zenit_ui/zenit_ui.dart';

class ZenitWindowTitlebar extends StatefulWidget with PreferredSizeWidget {
  /// By default the titlebar uses the window title
  final String? customTitle;
  const ZenitWindowTitlebar({super.key, this.customTitle});

  @override
  State<ZenitWindowTitlebar> createState() => _ZenitWindowTitlebarState();

  @override
  Size get preferredSize => const Size.fromHeight(42);
}

class _ZenitWindowTitlebarState extends State<ZenitWindowTitlebar> with WindowListener {
  @override
  void initState() {
    ZenitWindow.instance.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    ZenitWindow.instance.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.maybeOf(context);
    return SizedBox.fromSize(
      size: widget.preferredSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(context),
          _buildForeground(navigator, context),
        ],
      ),
    );
  }

  Padding _buildForeground(NavigatorState? navigator, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Gap(4),
          ZenitWindowControl(
            icon: Icons.chevron_left,
            onPressed: () => navigator?.maybePop(context),
          ),
          const Gap(24),
          IgnorePointer(
            child: FutureBuilder(
              future: ZenitWindow.getTitle(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                return Text(widget.customTitle ?? (snapshot.data ?? "Loading..."));
              },
            ),
          ),
          const Spacer(),
          const ZenitWindowControlRow(),
          const Gap(4),
        ],
      ),
    );
  }

  GestureDetector _buildBackground(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onSecondaryTap: () async => ZenitWindow.instance.popUpWindowMenu(),
      onDoubleTap: () async => ZenitWindow.toggleMaximize(),
      onPanStart: (details) async => ZenitWindow.instance.startDragging(),
      child: Material(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ZenitTheme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}
