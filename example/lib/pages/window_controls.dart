import 'package:zenit_ui/zenit_ui.dart';

class ZenitWindowControlsExample extends StatelessWidget {
  const ZenitWindowControlsExample({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _draggableArea(width),
          const Gap(24),
          _defaultWindowControls(context, width),
          const Gap(24),
          _customWindowControlButton(context, width)
        ],
      ),
    );
  }

  SizedBox _defaultWindowControls(BuildContext context, double width) {
    return SizedBox(
      width: width,
      child: Card(
        child: ListTile(
          iconColor: ZenitTheme.of(context).foregroundColor,
          title: const Text("Custom Window Controls"),
          trailing: const ZenitWindowControlRow(),
        ),
      ),
    );
  }

  SizedBox _customWindowControlButton(BuildContext context, double width) {
    return SizedBox(
      width: width,
      child: Card(
        child: ListTile(
          iconColor: ZenitTheme.of(context).foregroundColor,
          title: const Text("Custom Window Controls"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZenitWindowControl(
                icon: Icons.chevron_left,
                onPressed: () => Navigator.maybePop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _draggableArea(double width) {
    return SizedBox(
      width: width,
      height: 200,
      child: GestureDetector(
        child: const Card(
          child: Center(child: Text("Drag the window around")),
        ),
        onPanStart: (details) async {
          await ZenitWindow.instance.startDragging();
        },
        onDoubleTap: () async => ZenitWindow.toggleMaximize(),
      ),
    );
  }
}
