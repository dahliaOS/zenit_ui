import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: FilledButton(
          onPressed: () => print("test"),
          backgroundColor: Colors.blue,
          child: const Text("Filled Button"),
        )),
      ),
    );
  }
}
