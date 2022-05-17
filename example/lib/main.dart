import 'package:zenit_ui/zenit_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xffffffff),
                child: Center(
                  child: Transform.scale(
                    scale: 1,
                    /* child: Switch(
                      onChanged: (val) {
                        setState(() {
                          value = val;
                        });
                      },
                      value: value,
                    ), */
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,  
                      children: [
                        PrimaryButton(
                          onPressed: () => print("PrimaryButton was clicked"),
                          backgroundColor: Colors.blue,
                          foregroundColor: const Color(0xffffffff),
                          child: const Text(
                            "Primary Button",
                          ),
                        ),
                        const Gap(8),
                        SecondaryButton(
                          onPressed: () => print("SecondaryButton was clicked"),
                          foregroundColor: const Color(0xff000000),
                          child: const Text(
                            "Secondary Button",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: TabView(
              tabs: [
                TabViewPage(
                  title: 'Test',
                  view: const SizedBox(),
                ),
              ],
            )
                ),
          ],
        ),
      ),
    );
  }
}
