import '../menu/menu.dart';

class Order {
  int id;
  String customer;
  List<Menu> items = [];
  double totalPrice = 0.0;
  String status = 'Pending';
  String paymentStatus = 'Unpaid';

  Order(this.id, this.customer);

  void addItemToOrder(Menu item) {
    items.add(item);
    calculateTotal();
  }

  void calculateTotal() {
    totalPrice = items.fold(0, (sum, item) => sum + item.price);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer,
      'items': items.map((item) => item.toJson()).toList(),
      'totalPrice': totalPrice,
      'status': status,
      'paymentStatus': paymentStatus,
    };
  }

}
