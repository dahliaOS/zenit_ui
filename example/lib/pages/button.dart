import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitButtonExample extends StatelessWidget {
  const ZenitButtonExample({super.key});
  final _kButtonWidth = 160.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(8),
        const ExampleTitle("ZenitButton"),
        const Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _filledButton(),
            const Gap(12),
            _solidButton(),
            const Gap(12),
            _textButton(),
          ],
        ),
        const Gap(24),
        const ExampleSubtitle("Custom ListTiles with ZenitButtons"),
        const Gap(8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 + 256,
          child: Card(
            child: Column(
              children: [
                _buttonListTile(trailing: _filledButton(), buttonName: "ZenitFilledButton"),
                _buttonListTile(trailing: _solidButton(), buttonName: "ZenitSolidButton"),
                _buttonListTile(trailing: _textButton(), buttonName: "ZenitTextButton"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ListTile _buttonListTile({required Widget trailing, required String buttonName}) {
    return ListTile(
      title: Text(
        "A ListTile with a $buttonName",
      ),
      subtitle: const Text(
        "This is the subtitle",
      ),
      trailing: trailing,
    );
  }

  SizedBox _textButton() {
    return SizedBox(
      width: _kButtonWidth,
      child: ZenitTextButton(
        onPressed: () => print("FilledButton was clicked"),
        child: const Text("TextButton"),
      ),
    );
  }

  SizedBox _solidButton() {
    return SizedBox(
      width: _kButtonWidth,
      child: ZenitSecondaryButton(
        onPressed: () => print("SolidButton was clicked"),
        child: const Text("SolidButton"),
      ),
    );
  }

  SizedBox _filledButton() {
    return SizedBox(
      width: _kButtonWidth,
      child: ZenitPrimaryButton(
        onPressed: () => print("TextButton was clicked"),
        child: const Text("FilledButton"),
      ),
    );
  }
}
