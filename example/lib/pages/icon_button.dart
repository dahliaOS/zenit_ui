import 'package:zenit_ui/zenit_ui.dart';

class ZenitIconButtonExample extends StatelessWidget {
  const ZenitIconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZenitIconButton(
          icon: Icons.remove_red_eye,
          onPressed: () {},
        ),
        const Gap(16),
        ZenitIconButton(
          icon: Icons.add,
          onPressed: () {},
        ),
        const Gap(16),
        ZenitIconButton(
          icon: Icons.close,
          onPressed: () {},
        ),
      ],
    );
  }
}
