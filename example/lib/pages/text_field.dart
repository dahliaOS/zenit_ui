import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

class ZenitTextFieldExample extends StatefulWidget {
  const ZenitTextFieldExample({super.key});

  @override
  State<ZenitTextFieldExample> createState() => _ZenitTextFieldExampleState();
}

class _ZenitTextFieldExampleState extends State<ZenitTextFieldExample> {
  String text = "";
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(8),
          const ExampleTitle("ZenitTextField"),
          const Gap(24),
          SizedBox(
            width: 256,
            child: ZenitTextField(
              hint: "Text Field! You can type here",
              controller: controller,
              onChanged: (value) => setState(() => text = controller.text),
            ),
          ),
          const Gap(8),
          Text(
            "Your Text is here:\n $text",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
