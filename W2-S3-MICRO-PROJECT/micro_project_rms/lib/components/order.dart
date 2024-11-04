import 'recipe.dart';
import 'menu.dart';
import 'dart:io';

class Order {
  final int order_id;
  double _total_price = 0;
  String _payment_method = '';
  bool _payment_status = false;
  List<int> order_items = [];
  Menu menu = Menu();
  var file;

  Order({required this.order_id, required this.order_items}) {
    file = File("lib/database/orders/receipt$order_id.json");
  }

  void _calculateTotalPrice() {
    for (int i = 0; i < order_items.length; i++) {
      _total_price +=
          menu.items!.values.elementAt(order_items[i] - 1).toDouble();
    }
    print("Total price: $_total_price");
  }

  double get total_price {
    _calculateTotalPrice();
    return _total_price;
  }

  String get orderStatus {
    return _payment_status ? 'Paid' : 'Pending';
  }

  set payment_status(bool status) {
    _payment_status = status;
    writeRecipeJson();
  }

  set payment_method(String method) {
    _payment_method = method;
  }

  void writeRecipeJson() {
    Recipe recipe = Recipe(
      order_id: order_id.toString(),
      items: order_items
          .map((e) => menu.items!.keys.elementAt(e - 1))
          .toList()
          .cast<String>(),
      payment_method: _payment_method,
      total_price: total_price,
      order_date: DateTime.now(),
    );
    recipe.writeRecipeJson();
  }
}
