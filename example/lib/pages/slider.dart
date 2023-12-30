import 'package:zenit_ui/zenit_ui.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ZenitSlider(
          onChanged: (val) {
            setState(() {
              value = val;
            });
          },
          value: value,
        ),
      ),
    );
  }
}
