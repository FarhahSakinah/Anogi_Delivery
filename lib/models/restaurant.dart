import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'food.dart';
import 'cart_item.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // BURGERS
    Food(
      name: 'Classic Burger',
      description: 'Juicy beef patty with lettuce, tomato, and cheese',
      imagePath: 'lib/images/burgers/1.jpg',
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
        Addon(name: "Avocado", price: 1.29),
      ],
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description: 'Crispy chicken with spicy mayo and pickles',
      imagePath: 'lib/images/burgers/2.jpg',
      price: 9.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Spicy Sauce", price: 0.99),
        Addon(name: "Onion Rings", price: 1.29),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: 'Grilled vegetable patty with hummus and sprouts',
      imagePath: 'lib/images/burgers/3.jpg',
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Hummus", price: 0.79),
        Addon(name: "Feta Cheese", price: 1.19),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description: 'Beef patty with BBQ sauce, bacon, and onion rings',
      imagePath: 'lib/images/burgers/4.jpg',
      price: 10.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra BBQ Sauce", price: 0.99),
        Addon(name: "Coleslaw", price: 1.29),
      ],
    ),
    Food(
      name: 'Mushroom Swiss Burger',
      description: 'Beef patty with sautéed mushrooms and Swiss cheese',
      imagePath: 'lib/images/burgers/5.jpg',
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Mushrooms", price: 0.89),
        Addon(name: "Garlic Aioli", price: 0.99),
      ],
    ),

    // SALADS
    Food(
      name: 'Caesar Salad',
      description: 'Crisp romaine lettuce with Caesar dressing and croutons',
      imagePath: 'lib/images/salads/11.jpg',
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.49),
        Addon(name: "Extra Dressing", price: 0.49),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: 'Mixed greens with feta cheese, olives, and vinaigrette',
      imagePath: 'lib/images/salads/12.jpg',
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Feta", price: 0.99),
        Addon(name: "Olives", price: 0.79),
      ],
    ),
    Food(
      name: 'Caprese Salad',
      description: 'Fresh mozzarella, tomatoes, and basil with balsamic glaze',
      imagePath: 'lib/images/salads/13.jpg',
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Balsamic Reduction", price: 0.49),
        Addon(name: "Avocado", price: 1.29),
      ],
    ),
    Food(
      name: 'Spinach Salad',
      description: 'Baby spinach with strawberries, walnuts, and goat cheese',
      imagePath: 'lib/images/salads/14.jpg',
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Salmon", price: 3.99),
        Addon(name: "Honey Mustard Dressing", price: 0.49),
      ],
    ),
    Food(
      name: 'Asian Chicken Salad',
      description: 'Mixed greens with grilled chicken, mandarin oranges, and sesame dressing',
      imagePath: 'lib/images/salads/15.jpg',
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Chicken", price: 2.49),
        Addon(name: "Sesame Seeds", price: 0.49),
      ],
    ),

    // SIDES
    Food(
      name: 'French Fries',
      description: 'Crispy golden fries with a side of ketchup',
      imagePath: 'lib/images/sides/21.jpg',
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Chili", price: 1.49),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Crispy battered onion rings with ranch dipping sauce',
      imagePath: 'lib/images/sides/22.jpg',
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Spicy Ranch", price: 0.49),
        Addon(name: "BBQ Sauce", price: 0.49),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: 'Fried mozzarella sticks with marinara sauce',
      imagePath: 'lib/images/sides/23.jpg',
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Marinara", price: 0.49),
        Addon(name: "Parmesan Cheese", price: 0.79),
      ],
    ),

    // DESSERTS
    Food(
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with a gooey molten center',
      imagePath: 'lib/images/desserts/6.jpg',
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.49),
        Addon(name: "Whipped Cream", price: 0.49),
      ],
    ),
    Food(
      name: 'Cheesecake',
      description: 'Creamy cheesecake with a graham cracker crust',
      imagePath: 'lib/images/desserts/7.jpg',
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Strawberry Sauce", price: 0.79),
        Addon(name: "Chocolate Drizzle", price: 0.79),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description: 'Classic apple pie with a flaky crust and cinnamon',
      imagePath: 'lib/images/desserts/8.jpg',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.49),
        Addon(name: "Caramel Sauce", price: 0.79),
      ],
    ),
    Food(
      name: 'Brownie Sundae',
      description: 'Warm brownie topped with ice cream and chocolate sauce',
      imagePath: 'lib/images/desserts/9.jpg',
      price: 6.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Brownie", price: 1.49),
        Addon(name: "Nuts", price: 0.79),
      ],
    ),
    Food(
      name: 'Tiramisu',
      description: 'Classic Italian dessert with coffee-soaked ladyfingers and mascarpone cheese',
      imagePath: 'lib/images/desserts/10.jpg',
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Cocoa Powder", price: 0.49),
        Addon(name: "Chocolate Shavings", price: 0.79),
      ],
    ),

    // DRINKS
    Food(
      name: 'Coca-Cola',
      description: 'Classic Coca-Cola soft drink',
      imagePath: 'lib/images/drinks/20.jpg',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 0.29),
        Addon(name: "Ice", price: 0.00),
      ],
    ),
    Food(
      name: 'Iced Tea',
      description: 'Refreshing iced tea with lemon',
      imagePath: 'lib/images/drinks/21.jpg',
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 0.29),
        Addon(name: "Sweetener", price: 0.19),
      ],
    ),
    Food(
      name: 'Lemonade',
      description: 'Freshly squeezed lemonade',
      imagePath: 'lib/images/drinks/22.jpg',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Lemon", price: 0.29),
        Addon(name: "Mint", price: 0.19),
      ],
    ),
    Food(
      name: 'Coffee',
      description: 'Freshly brewed coffee',
      imagePath: 'lib/images/drinks/23.jpg',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Cream", price: 0.19),
        Addon(name: "Sugar", price: 0.19),
      ],
    ),
    Food(
      name: 'Milkshake',
      description: 'Creamy milkshake with your choice of flavor',
      imagePath: 'lib/images/drinks/24.jpg',
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Flavor", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.49),
      ],
    ),
  ];

  //delivery address (which user can change/update)
  String _deliveryAddress = 'Taman Bahtera';

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // ✅ Cart List
  final List<CartItem> _cart = [];

  // ✅ Getter: Menu
  List<Food> get menu => _menu;

  // ✅ Getter: Cart
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // ✅ Add to Cart
  void addToCart(Food food, List<Addon> selectedAddons, int quantity) {
    _cart.add(CartItem(food: food, sellectedAddons: selectedAddons, quantity: quantity));
    notifyListeners();
  }

  // ✅ Remove from Cart
  void removeFromCart(CartItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  // ✅ Clear Cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // ✅ Total Price
  double get gettotalPrice {
    return _cart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // ✅ Total Items
  int get getTotalItems {
    return _cart.fold(0, (sum, item) => sum + item.quantity);
  }

  // ✅ Price Formatter
  String formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
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
    receipt.writeln("Total Items: $getTotalItems");
    receipt.writeln("Total Price: ${formatPrice(gettotalPrice)}");
    receipt.writeln();
    receipt.writeln("Delivering to: $_deliveryAddress");

    return receipt.toString();
  }

  // ✅ Private helper to format add-ons
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${formatPrice(addon.price)})")
        .join(", ");
  }
}