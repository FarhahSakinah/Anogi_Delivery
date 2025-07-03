import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'food.dart';
import 'cart_item.dart';  // Make sure this is the correct path

class Restaurant extends ChangeNotifier {
  // List of food menu (this part you can keep as you already have)

  final List<Food> _menu = [
    // Your food items (not shown here to save space)
  ];

  // ✅ Expose the menu publicly
  List<Food> get menu => _menu;

  // ✅ Get food by name
  Food? getFoodByName(String name) {
    return _menu.firstWhereOrNull(
      (food) => food.name.toLowerCase() == name.toLowerCase(),
    );
  }

  // ✅ Get foods by category
  List<Food> getFoodsByCategory(FoodCategory category) {
    return _menu.where((food) => food.category == category).toList();
  }

  // ✅ Cart operations
  final List<CartItem> _cart = [];

  // ✅ Expose cart publicly
  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? existingItem = _cart.firstWhereOrNull((item) {
      bool sameFood = item.food == food;
      bool sameAddons = const ListEquality().equals(item.sellectedAddons, selectedAddons);
      return sameFood && sameAddons;
    });

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, sellectedAddons: selectedAddons, quantity: 1));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int index = _cart.indexOf(cartItem);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cart) {
      double itemTotal = item.food.price;
      for (var addon in item.sellectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * item.quantity;
    }
    return total;
  }

  int get totalItems {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity;
    }
    return total;
  }

  String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // ✅ Generate Receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('--------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${formatPrice(cartItem.food.price)}");
      if (cartItem.sellectedAddons.isNotEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.sellectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("---------------");
    receipt.writeln("Total Items: $totalItems");
    receipt.writeln("Total Price: ${formatPrice(totalPrice)}");

    return receipt.toString();
  }

  // ✅ Private helper to format add-ons
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${formatPrice(addon.price)})")
        .join(", ");
  }
}
