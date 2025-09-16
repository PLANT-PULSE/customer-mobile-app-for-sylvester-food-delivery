class Order {
  final String id;
  final String restaurantName;
  final String restaurantImage;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime orderTime;
  final String status; // 'pending', 'preparing', 'delivered', 'cancelled'

  Order({
    required this.id,
    required this.restaurantName,
    required this.restaurantImage,
    required this.items,
    required this.totalPrice,
    required this.orderTime,
    required this.status,
  });
}

class OrderItem {
  final String name;
  final String image;
  final double price;
  final int quantity;

  OrderItem({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
