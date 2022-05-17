import 'package:zenit_ui/zenit_ui.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key, required this.tabs}) : super(key: key);

  final List<TabViewPage> tabs;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 48,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Constants.darkElelementColor,
            ),
            child: Row(
              children: widget.tabs
                  .map(
                    (TabViewPage e) => Tab(
                      title: Text(e.title),
                      onClose: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Positioned(
          top: 48,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: ZenitColors.blue,
          ),
        )
      ],
    );
  }
}
