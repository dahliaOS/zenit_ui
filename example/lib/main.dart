import 'package:flutter/material.dart' as material;
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
    return material.MaterialApp(
      home: material.Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xffffffff),
                child: Center(
                  child: Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      onChanged: (val) {
                        setState(() {
                          value = val;
                        });
                      },
                      value: value,
                    ),
                    /* child: PrimaryButton(
                      enabled: false,
                      onPressed: () => print("test"),
                      backgroundColor: const Color(0xFF009966),
                      foregroundColor: const Color(0xfffafafa),
                      child: const Text(
                        "Disabled Button",
                      ),
                    ), */
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
                /* child: Container(
                color: const Color(0xff121212),
                child: material.Theme(
                  data: material.ThemeData(
                    brightness: material.Brightness.dark,
                  ),
                  child: Center(
                    child: Transform.scale(
                      scale: 1.0,
                      child: /* PrimaryButton(
                        enabled: false,
                        debugDarkMode: true,
                        onPressed: () => print("test"),
                        backgroundColor: const Color(0xFF009966),
                        foregroundColor: const Color(0xff212121),
                        child: const Text(
                          "Disabled Button",
                        ),
                      ), */
                          material.Row(
                        mainAxisAlignment: material.MainAxisAlignment.center,
                        children: [
                          Tab(
                            onClose: () {},
                            enabled: true,
                          ),
                          Tab(
                            onClose: () {},
                          ),
                          Tab(
                            onClose: () {},
                          ),
                          Tab(
                            onClose: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ), */
                ),
          ],
        ),
      ),
    );
  }
}
