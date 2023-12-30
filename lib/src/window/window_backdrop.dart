import 'package:flutter/widgets.dart';
import 'package:yaru_window/yaru_window.dart';

class ZenitWindowBackdropEffect extends StatelessWidget {
  final Widget child;
  final YaruWindowState? state;

  const ZenitWindowBackdropEffect({super.key, required this.child, this.state});

  static final _windowStates = <YaruWindowInstance, YaruWindowState>{};

  @override
  Widget build(BuildContext context) {
    if (state == null) {
      final YaruWindowInstance window = YaruWindow.of(context);
      return StreamBuilder<YaruWindowState>(
        stream: window.states(),
        initialData: _windowStates[window],
        builder: (context, snapshot) {
          final state = snapshot.data;
          return _animatedOpacity(state);
        },
      );
    } else {
      return _animatedOpacity(state);
    }
  }

  AnimatedOpacity _animatedOpacity(YaruWindowState? state) {
    return AnimatedOpacity(
      opacity: state?.isActive == true ? 1 : 0.75,
      duration: const Duration(milliseconds: 100),
      child: child,
    );
  }
}
