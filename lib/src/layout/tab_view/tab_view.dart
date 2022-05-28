import 'package:zenit_ui/zenit_ui.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key, required this.pages}) : super(key: key);

  final List<TabViewPage> pages;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 44,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.pages
                    .asMap()
                    .map(
                      (index, TabViewPage e) => MapEntry(
                        index,
                        Tab(
                          title: e.title,
                          enabled: currentTabIndex == index,
                          onClose: () {
                            setState(() {
                              widget.pages.removeAt(index);
                              if (index == widget.pages.length) {
                                currentTabIndex = index - 1;
                              }
                            });
                          },
                          onPressed: () {
                            setState(() {
                              currentTabIndex = index;
                            });
                          },
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
        ),
        Positioned(
          top: 44,
          left: 0,
          right: 0,
          bottom: 0,
          child: widget.pages
              .map((TabViewPage e) => e.view)
              .toList()[currentTabIndex],
        )
      ],
    );
  }
}
