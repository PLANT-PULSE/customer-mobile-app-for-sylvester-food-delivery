import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/navigation_provider.dart';
import 'history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          if (!auth.isLoggedIn) {
            return const Center(
              child: Text('Please log in to view your profile'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // User Name
                Text(
                  auth.userName.isNotEmpty ? auth.userName : 'User',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // User Email
                Text(
                  auth.userEmail.isNotEmpty ? auth.userEmail : 'user@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),

                // User Phone
                if (auth.userPhone.isNotEmpty)
                  Text(
                    auth.userPhone,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),

                // User Address
                if (auth.userAddress.isNotEmpty)
                  Text(
                    auth.userAddress,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                const SizedBox(height: 32),

                // Profile Options
                _buildProfileOption(
                  context,
                  'Edit Profile',
                  Icons.edit,
                  () {
                    final nameController = TextEditingController(text: auth.userName);
                    final emailController = TextEditingController(text: auth.userEmail);
                    final phoneController = TextEditingController(text: auth.userPhone);
                    final addressController = TextEditingController(text: auth.userAddress);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Edit Profile'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
                              TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
                              TextField(controller: phoneController, decoration: const InputDecoration(labelText: 'Phone')),
                              TextField(controller: addressController, decoration: const InputDecoration(labelText: 'Address')),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                          TextButton(
                            onPressed: () {
                              auth.updateProfile(nameController.text, emailController.text, phoneController.text, addressController.text);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated')));
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  context,
                  'Password Reset',
                  Icons.lock,
                  () {
                    final passwordController = TextEditingController();
                    final confirmController = TextEditingController();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Reset Password'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'New Password'), obscureText: true),
                            TextField(controller: confirmController, decoration: const InputDecoration(labelText: 'Confirm Password'), obscureText: true),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                          TextButton(
                            onPressed: () {
                              if (passwordController.text == confirmController.text && passwordController.text.isNotEmpty) {
                                auth.resetPassword(passwordController.text);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password reset successfully')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Passwords do not match or empty')));
                              }
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  context,
                  'Order History',
                  Icons.history,
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()));
                  },
                ),
                _buildProfileOption(
                  context,
                  'Payment Methods',
                  Icons.payment,
                  () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Payment Methods'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (auth.paymentMethods.isEmpty)
                                const Text('No payment methods added.'),
                              ...auth.paymentMethods.map((method) => ListTile(title: Text(method))),
                              ElevatedButton(
                                onPressed: () {
                                  final controller = TextEditingController();
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Add Payment Method'),
                                      content: TextField(controller: controller, decoration: const InputDecoration(labelText: 'Card Number or Method')),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                        TextButton(
                                          onPressed: () {
                                            if (controller.text.isNotEmpty) {
                                              auth.addPaymentMethod(controller.text);
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Text('Add'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Add Payment Method'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                        ],
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  context,
                  'Address Book',
                  Icons.location_on,
                  () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Address Book'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (auth.addresses.isEmpty)
                                const Text('No addresses added.'),
                              ...auth.addresses.map((address) => ListTile(title: Text(address))),
                              ElevatedButton(
                                onPressed: () {
                                  final controller = TextEditingController();
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Add Address'),
                                      content: TextField(controller: controller, decoration: const InputDecoration(labelText: 'Address')),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                        TextButton(
                                          onPressed: () {
                                            if (controller.text.isNotEmpty) {
                                              auth.addAddress(controller.text);
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Text('Add'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Add Address'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                        ],
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  context,
                  'Settings',
                  Icons.settings,
                  () {
                    final navigation = Provider.of<NavigationProvider>(context, listen: false);
                    bool notifications = true; // Mock
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Settings'),
                        content: StatefulBuilder(
                          builder: (context, setState) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SwitchListTile(
                                title: const Text('Enable Notifications'),
                                value: notifications,
                                onChanged: (value) {
                                  setState(() {
                                    notifications = value;
                                  });
                                  // In real app, save to preferences
                                },
                              ),
                              SwitchListTile(
                                title: const Text('Dark Mode'),
                                value: navigation.themeMode == ThemeMode.dark,
                                onChanged: (value) {
                                  navigation.toggleTheme();
                                  setState(() {});
                                },
                              ),
                              const SizedBox(height: 16),
                              const Text('More settings coming soon!'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                        ],
                      ),
                    );
                  },
                ),
                _buildProfileOption(
                  context,
                  'Help & Support',
                  Icons.help,
                  () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Help & Support'),
                        content: const SingleChildScrollView(
                          child: Text(
                            'For help and support, please contact us at:\n\n'
                            'Email: support@sylvesterfood.com\n'
                            'Phone: +1 (123) 456-7890\n\n'
                            'Frequently Asked Questions:\n\n'
                            'Q: How to place an order?\n'
                            'A: Browse restaurants, add items to cart, and checkout.\n\n'
                            'Q: How to reset password?\n'
                            'A: Go to Profile > Password Reset.\n\n'
                            'More FAQs coming soon!',
                          ),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 32),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      auth.logout();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Logged out successfully'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
