import 'package:zenit_ui/zenit_ui.dart';

class TabView extends StatefulWidget {
  const TabView({
    Key? key,
    required this.pages,
    this.onNewPage,
    this.onPageChanged,
    this.onPageClosed,
    this.excludeFocus,
  }) : super(key: key);

  final List<TabViewPage> pages;

  final VoidCallback? onNewPage;

  final ValueChanged<int>? onPageChanged;

  final ValueChanged<int>? onPageClosed;

  final bool? excludeFocus;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeFocus(
          excluding: widget.excludeFocus ?? false,
          child: Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 44,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 48,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.pages.length,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      itemBuilder: (context, index) {
                        final e = widget.pages[index];
                        return Tab(
                          title: e.title,
                          enabled: currentTabIndex == index,
                          onClose: () {
                            setState(() {
                              if (widget.pages.length > 1) {
                                widget.pages.removeAt(index);
                                widget.onPageClosed?.call(index);
                                if (index == widget.pages.length) {
                                  currentTabIndex = index - 1;
                                  return;
                                }
                                currentTabIndex = index;
                              }
                            });
                          },
                          onPressed: () {
                            if (currentTabIndex != index) {
                              setState(() {
                                currentTabIndex = index;
                                widget.onPageChanged?.call(index);
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        widget.onNewPage?.call();
                        widget.onPageChanged?.call(widget.pages.length);
                        setState(() {
                          currentTabIndex = widget.pages.length - 1;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
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
