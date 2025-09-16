import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/navigation_provider.dart';
import '../models/order.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch orders from API GET /api/orders with auth header
    // Replace local orders with API data
    // Parse JSON into Order objects and update auth provider

    return Consumer2<AuthProvider, CartProvider>(
      builder: (context, auth, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order History'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: auth.isLoggedIn
              ? (auth.orders.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.history,
                            size: 80,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'No orders yet',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to home screen to place order
                              Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
                            },
                            child: const Text('Place an Order'),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: auth.orders.length,
                      itemBuilder: (context, index) {
                        final order = auth.orders[index];
                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.receipt),
                                title: Text('Order #${order.id}'),
                                subtitle: Text('Status: ${order.status} | Total: \$${order.totalPrice.toStringAsFixed(2)}'),
                                trailing: Text(order.orderTime.toString().split(' ')[0]),
                              ),
                              ...order.items.map((item) => ListTile(
                                    leading: const Icon(Icons.fastfood),
                                    title: Text(item.name),
                                    subtitle: Text('Quantity: ${item.quantity}'),
                                    trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Simulate purchase
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Purchase Order'),
                                        content: const Text('This would take you to the payment screen.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text('Purchase'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ))
              : const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Please login to view your order history',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Your past orders will appear here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
