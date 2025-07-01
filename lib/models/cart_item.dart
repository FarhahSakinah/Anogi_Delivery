import 'package:anogi_delivery/models/food.dart';

class CartItem{
  Food food;
  List<Addon> sellectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.sellectedAddons,
    required this.quantity,
  });

  double get totalPrice {
    double addonsPrice = sellectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}