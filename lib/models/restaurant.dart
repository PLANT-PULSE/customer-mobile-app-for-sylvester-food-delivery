import 'menu_item.dart';

class Restaurant {
  final String name;
  final String image;
  final List<MenuItem> menu;

  Restaurant({
    required this.name,
    required this.image,
    required this.menu,
  });
}
