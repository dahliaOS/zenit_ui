import 'package:zenit_ui/zenit_ui.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 0.5;
  double value2 = 0.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZenitSlider(
            divisions: 10,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
            value: value,
          ),
          const SizedBox(height: 32),
          ZenitSlider(
            onChanged: (val) {
              setState(() {
                value2 = val;
              });
            },
            value: value2,
          ),
        ],
      ),
    );
  }
}
