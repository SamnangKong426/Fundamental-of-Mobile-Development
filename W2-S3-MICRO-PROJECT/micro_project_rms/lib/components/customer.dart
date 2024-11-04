class Customer {
  final int customer_id;
  final String customer_name;
  final String customer_phone;

  Customer(this.customer_id, this.customer_name, this.customer_phone);

  void placeOrder() {
    print('Order placed successfully');
  }

  void reserveTable(int tableNumber) {
    print('Table reserved successfully');
  }

  void viewMenu() {
    print('Menu viewed successfully');
  }

  
}
