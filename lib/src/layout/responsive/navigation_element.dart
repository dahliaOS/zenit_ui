import 'package:zenit_ui/zenit_ui.dart';

class NavigationElement {
  final String title;
  final String? route;
  final IconData icon;
  final IconData? selectedIcon;

  NavigationElement({
    required this.title,
    required this.icon,
    this.route,
    this.selectedIcon,
  });
}
