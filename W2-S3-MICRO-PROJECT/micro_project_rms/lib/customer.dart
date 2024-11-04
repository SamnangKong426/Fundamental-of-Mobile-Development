import 'dart:convert';
import 'dart:io';
import 'components/menu.dart';
import 'components/order.dart';
import 'package:qr_terminal/qr_terminal.dart' as $qr_terminal;

class Customer {
  final Menu menu = Menu();
  int order_id;
  List<int> order_items = [];

  Customer() : order_id = _readOrderId();

  void startApp() {
    print('============= Welcome to our restaurant =============');
    print("Please select the menu you'd like to order:");
    while (true) {
      print("1. Display menu");
      print("2. Order food");
      print("3. Pay bill");
      print("0. Exit");
      stdout.write("Enter your choice: ");
      final choice = int.parse(stdin.readLineSync()!);
      print("=====================================================");
      switch (choice) {
        case 1:
          menu.displayMenu();
          break;
        case 2:
          _orderFood();
          break;
        case 3:
          _payBill();
          order_id++;
          order_items.clear();
          break;
        case 0:
          print('Thank you for visiting our restaurant!');
          _writeOrderId(order_id);
          exit(0);
        default:
          print('Invalid choice');
      }
      print("=====================================================");
    }
  }

  static int _readOrderId() {
    final file = File("lib/database/order_id.json");
    var contents = file.readAsStringSync();
    var jsonData = jsonDecode(contents);
    final int orderId = jsonData['order_id'].toInt();
    return orderId;
  }

  static void _writeOrderId(int orderId) {
    final file = File("lib/database/order_id.json");
    file.writeAsStringSync('{"order_id": $orderId}');
  }

  void _orderFood() {
    bool finishOrder = false;
    print("What would you like to order?");
    print("Enter item id and quantity (eg: 1 2)");
    print("Type 'done' when you have finished ordering");
    while (!finishOrder) {
      var input = stdin.readLineSync();
      if (input == 'done') {
        finishOrder = true;
        break;
      }
      order_items.add(int.parse(input!));
    }
    print("Your order: $order_items");
  }

  void _payBill() {
    Order paymentOrder = Order(order_id: order_id, order_items: order_items);
    print("Which way would you like to pay?");
    print("\t1. Cash");
    print("\t2. Credit Card");
    print("\t3. KHQR");
    stdout.write("Enter your choice: ");
    final choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        paymentOrder.payment_method = 'Cash';
        paymentOrder.payment_status = true;
        print("You have paid by cash");
        break;
      case 2:
        paymentOrder.payment_method = 'Credit Card';
        paymentOrder.payment_status = true;
        print("You have paid by credit card");
        break;
      case 3:
        $qr_terminal.generate("KHQR ${paymentOrder.total_price}",
            typeNumber: 1, small: true);
        print("");
        paymentOrder.payment_method = 'KHQR';
        print("You have paid by KHQR");
        break;
      default:
        print("Invalid choice");
    }
    paymentOrder.payment_status = true;
    print("Thank you for your payment!");
  }
}

void main() {
  Customer customer = Customer();
  customer.startApp();
}