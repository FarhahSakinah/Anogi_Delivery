import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burgers
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

    // salads
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
      description:
          'Mixed greens with grilled chicken, mandarin oranges, and sesame dressing',
      imagePath: 'lib/images/salads/15.jpg',
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Chicken", price: 2.49),
        Addon(name: "Sesame Seeds", price: 0.49),
      ],
    ),

    // sides
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

    // desserts
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
      description:
          'Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cheese',
      imagePath: 'lib/images/desserts/10.jpg',
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Cocoa Powder", price: 0.49),
        Addon(name: "Chocolate Shavings", price: 0.79),
      ],
    ),

    // drinks
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

  /*
  GETTERS
  */

  List<Food> get menu => _menu;

  Food? getFoodByName(String name) {
    return _menu.firstWhere(
      (food) => food.name.toLowerCase() == name.toLowerCase(),
      orElse: () => null,
    );
  }

  List<Food> getFoodsByCategory(FoodCategory category) {
    return _menu.where((food) => food.category == category).toList();
  }

  /*
  OPERATIONS
  */

  final List<CartItem> _cart = [];

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.sellectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        sellectedAddons: selectedAddons,
      ));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double get gettotalPrice {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.sellectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int get getTotalItems {
    int total = 0;
    for (CartItem cartItem in _cart) {
      total += cartItem.quantity;
    }
    return total;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  HELPERS
  */

  String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
}
