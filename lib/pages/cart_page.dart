import 'package:flutter/material.dart';
import 'package:anogi_delivery/models/restaurant.dart'; 
import 'package:provider/provider.dart';
import 'package:anogi_delivery/component/my_cart_tile.dart'; 
import 'package:anogi_delivery/component/my_button.dart'; 
import 'package:anogi_delivery/pages/payment_page.dart'; // ✅ Make sure this import is correct

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // Access the user's cart
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Clear Cart Button
              IconButton(
                onPressed: () {
                  if (userCart.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cart is already empty.")),
                    );
                    return;
                  }
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // Cancel Button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        // Yes Button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),

          body: Column(
            children: [
              // Cart Items or Empty Message
              Expanded(
                child: userCart.isEmpty
                    ? const Center(
                        child: Text("Cart is empty.."),
                      )
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
              ),

              // Go to Checkout Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: MyButton(
                  onTap: () {
                    if (userCart.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),  // ✅ Payment first
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Your cart is empty!")),
                      );
                    }
                  },
                  text: "Go to Checkout",
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
