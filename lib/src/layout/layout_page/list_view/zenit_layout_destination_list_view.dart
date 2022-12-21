import 'package:flutter/widgets.dart';
import 'package:zenit_ui/src/layout/layout_page/list_view/zenit_layout_tile.dart';
import 'package:zenit_ui/src/layout/layout_page/zenit_navigation_layout.dart';

class ZenitLayoutDestinationListView extends StatefulWidget {
  const ZenitLayoutDestinationListView({
    super.key,
    required this.builder,
    required this.length,
    required this.onTap,
    required this.selectedIndex,
  });

  final int length;

  final ZenitNavigationLayoutBuilder builder;

  final ValueChanged<int> onTap;

  final int selectedIndex;

  @override
  State<ZenitLayoutDestinationListView> createState() => _ZenitLayoutDestinationListViewState();
}

class _ZenitLayoutDestinationListViewState extends State<ZenitLayoutDestinationListView> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      padding: const EdgeInsets.symmetric(vertical: 8),
      controller: controller,
      itemCount: widget.length,
      itemBuilder: (context, index) => ZenitLayoutTileScope(
        index: index,
        selected: index == widget.selectedIndex,
        onTap: () => widget.onTap(index),
        child: Builder(
          builder: (context) => widget.builder(context, index, index == widget.selectedIndex),
        ),
      ),
    );
  }
}
