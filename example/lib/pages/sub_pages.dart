import 'package:zenit_ui/zenit_ui.dart';

class SubPagesExample extends StatelessWidget {
  const SubPagesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZenitPrimaryButton(
        child: const Text("Go to sub page"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const _SubPage(),
            ),
          );
        },
      ),
    );
  }
}

class _SubPage extends StatelessWidget {
  const _SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZenitPrimaryButton(
        child: const Text("Go to sub sub page"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const _SubSubPage(),
            ),
          );
        },
      ),
    );
  }
}

class _SubSubPage extends StatelessWidget {
  const _SubSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZenitPrimaryButton(
        child: const Text("Go back"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
