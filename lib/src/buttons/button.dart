import 'package:zenit_ui/src/components/base_button.dart';
import 'package:zenit_ui/zenit_ui.dart';

class FilledButton extends StatefulWidget {
  const FilledButton({
    Key? key,
    this.child,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  final Widget? child;

  final VoidCallback? onPressed;

  final Color? backgroundColor;

  @override
  _FilledButtonState createState() => _FilledButtonState();
}

class _FilledButtonState extends State<FilledButton> {
  final Color _backgroundColor = const Color(0xff0078F0);
  late Color _buttonColor;
  @override
  void initState() {
    _buttonColor = _backgroundColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color _hoverMixin = const Color(0xff000000).withOpacity(0.1);
    Color _focusMixin = const Color(0xff000000).withOpacity(0.2);
    return BaseButton(
      onPressed: () async {
        setState(() =>
            _buttonColor = Color.alphaBlend(_focusMixin, _backgroundColor));
        widget.onPressed?.call();
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() =>
            _buttonColor = Color.alphaBlend(_hoverMixin, _backgroundColor));
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _buttonColor = Color.alphaBlend(_hoverMixin, _backgroundColor);
          });
        },
        onExit: (_) {
          setState(() {
            _buttonColor = _backgroundColor;
          });
        },
        child: PhysicalModel(
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8),
          color: _buttonColor,
          child: Padding(
            padding: widget.child != null
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0)
                : EdgeInsets.zero,
            child: IconTheme.merge(
              data: IconThemeData(
                color: _buttonColor.computeLuminance() < 0.4
                    ? const Color(0xffffffff)
                    : const Color(0xff000000),
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: _buttonColor.computeLuminance() < 0.4
                      ? const Color(0xffffffff)
                      : const Color(0xff000000),
                ),
                child: widget.child ?? const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
