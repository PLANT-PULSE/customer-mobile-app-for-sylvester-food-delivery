import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/navigation_provider.dart';
import '../providers/auth_provider.dart';
import '../models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, _) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {},
                ),
                if (cart.items.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        '${cart.items.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Container(
              color: Colors.grey[100],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Add some delicious food to get started!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            color: Colors.grey[100],
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Cart Items
                ...cart.items.map((item) => Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        // Item Image
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Item Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${item.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity Controls
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cart.updateQuantity(item.name, item.quantity - 1);
                              },
                              icon: const Icon(Icons.remove),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                cart.updateQuantity(item.name, item.quantity + 1);
                              },
                              icon: const Icon(Icons.add),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),

                        // Remove Button
                        IconButton(
                          onPressed: () {
                            cart.removeItem(item.name);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                )),

                const SizedBox(height: 20),

                // Order Summary
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text('\$${cart.subtotal.toStringAsFixed(2)}'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Delivery Fee'),
                            Text('\$${cart.deliveryFee.toStringAsFixed(2)}'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tax'),
                            Text('\$${cart.tax.toStringAsFixed(2)}'),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${cart.total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF6B35),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedPaymentMethod == null) {
                        _showPaymentOptionsDialog();
                      } else {
                        final cart = Provider.of<CartProvider>(context, listen: false);
                        final auth = Provider.of<AuthProvider>(context, listen: false);
                        if (cart.items.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Your cart is empty')),
                          );
                          return;
                        }
                        // TODO: Replace mock with API call to POST /api/orders
                        // Send cart items, total, etc. in JSON body with auth header
                        // On success, add order to auth provider and clear cart

                        // Mock order placement (remove when API is ready)
                        final orderItems = cart.items
                            .map((item) => OrderItem(
                                  name: item.name,
                                  image: '', // Could add image URL if available
                                  price: item.price,
                                  quantity: item.quantity,
                                ))
                            .toList();
                        final order = Order(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          restaurantName: 'Your Order',
                          restaurantImage: '',
                          items: orderItems,
                          totalPrice: cart.total,
                          orderTime: DateTime.now(),
                          status: 'pending',
                        );
                        auth.addOrder(order);
                        cart.clear();
                        setState(() {
                          selectedPaymentMethod = null;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Order placed successfully')),
                        );
                        // Navigate to order history screen
                        Provider.of<NavigationProvider>(context, listen: false).setIndex(1);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      selectedPaymentMethod == null ? 'Proceed to Checkout' : 'Place Order',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
            ),
          );
        },
      ),
    );
  }

  void _showPaymentOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: const Text('Mobile Money'),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Mobile Money';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.credit_card),
                title: const Text('Credit/Debit Card'),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Credit/Debit Card';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Pay in Person'),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Pay in Person';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
