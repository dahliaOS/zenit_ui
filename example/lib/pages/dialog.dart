import 'package:zenit_ui/zenit_ui.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZenitPrimaryButton(
        child: const Text("Show dialog"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ZenitDialog(
              title: const Text("ZenitDialog Widget"),
              icon: const FlutterLogo(),
              content: const Text(
                  "Dialog content\nThis dialog is for demo purposes only.\nIt says it saves something but it actually doesn't.\nThose buttons are only there for show"),
              actions: [
                SizedBox(
                  width: 100,
                  child: ZenitTextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ZenitPrimaryButton(
                    child: const Text("Save"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
