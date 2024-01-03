import 'package:flutter/material.dart';

class ExampleTitle extends StatelessWidget {
  final String title;
  const ExampleTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}

class ExampleSubtitle extends StatelessWidget {
  final String title;
  const ExampleSubtitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
