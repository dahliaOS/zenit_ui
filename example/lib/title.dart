import 'package:flutter/material.dart';

class ExampleTitle extends StatelessWidget {
  final String title;
  const ExampleTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
