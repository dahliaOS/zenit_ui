import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zenit_ui/zenit_ui.dart';
import 'package:zenit_ui_example/title.dart';

const kButtonWidth = 132.0;

class ZenitWelcome extends StatefulWidget {
  const ZenitWelcome({super.key});

  @override
  State<ZenitWelcome> createState() => _ZenitWelcomeState();
}

class _ZenitWelcomeState extends State<ZenitWelcome> {
  double val = 0.5;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(24),
          SizedBox(
            width: 500,
            height: 175,
            child: ZenitSection(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(24),
          const ExampleTitle("ZenitUI Flutter Showcase App"),
          const Gap(24),
          const ExampleSubtitle("What is ZenitUI?"),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 750,
              child: Text(
                "ZenitUI is a widget library for Flutter that provides a set of customizable widgets that can be used to build user interfaces. It is designed to be compatible and interchangeable with the Material library. With ZenitUI, developers can create UIs with ease and speed up their development process.",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Gap(24),
          const ExampleSubtitle("Who maintains ZenitUI?"),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 750,
              child: Text(
                "ZenitUI is a community project maintained by dahliaOS",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Gap(24),
          const ExampleSubtitle("Currently supported ZenitUI widgets"),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 750,
              child: Text(
                "Button, Switch, Checkbox, RadioButton, IconButton, TextField, TabBar",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Gap(24),
          SizedBox(
            width: 250,
            height: 80,
            child: ZenitSection(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Theme.of(context).darkMode ? "assets/dahliaos_banner_dark.png" : "assets/dahliaos_banner_light.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
