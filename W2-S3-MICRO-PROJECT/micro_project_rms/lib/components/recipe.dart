import 'dart:convert';
import 'dart:io';

class Recipe {
  final String order_id;
  final List<String> items;
  final String payment_method;
  final double total_price;

  final DateTime order_date;
  File _file;

  Recipe({
    required this.order_id,
    required this.items,
    required this.payment_method,
    required this.total_price,
    required this.order_date,
  }) : _file = File("lib/database/orders/receipt$order_id.json");

  Map<String, dynamic> toJson() {
    return {
      'order_id': order_id,
      'items': items,
      'payment_method': payment_method,
      'total_price': total_price,
      'order_date': order_date.toIso8601String(),
    };
  }

  void writeRecipeJson() {
    var jsonData = {
      'order': this.order_id,
      'items': this.items,
      'payment_method': this.payment_method,
      'total_price': this.total_price,
      'date': this.order_date.toString(),
    };
    var jsonString = jsonEncode(jsonData);
    _file.writeAsStringSync(jsonString);
  }

  @override
  String toString() {
    return 'Order ID: $order_id\nItems: $items\nPayment Method: $payment_method\nTotal Price: $total_price\nOrder Date: $order_date';
  }
}

// Exmaple
/*
void main() {
  final recipe = Recipe(
    order_id: '1',
    items: ['Burger', 'Fries', 'Coke'],
    total_price: 15.0,
    order_date: DateTime.now(),
  );

  recipe.writeRecipeJson();
  print(recipe);
}
*/