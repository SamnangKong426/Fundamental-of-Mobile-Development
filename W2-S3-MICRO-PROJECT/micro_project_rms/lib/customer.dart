import 'dart:convert';
import 'dart:io';
import 'components/menu.dart';
import 'components/order.dart';
import 'package:qr_terminal/qr_terminal.dart' as $qr_terminal;

void main() {
  startApp();
}

void startApp() {
  final menu = Menu();
  int order_id = readOrderId();
  List<int> order_items = [];

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
        orderFood(order_id, order_items);
        break;
      case 3:
        payBill(order_id, order_items);
        order_id++;
        order_items.clear();
        break;
      case 0:
        print('Thank you for visiting our restaurant!');
        writeOrderId(order_id);
        exit(0);
      default:
        print('Invalid choice');
    }
    print("=====================================================");
  }
}

int readOrderId() {
  final file = File("lib/database/order_id.json");
  var contents = file.readAsStringSync();
  var jsonData = jsonDecode(contents);
  final int order_id = jsonData['order_id'].toInt();
  return order_id;
}

void writeOrderId(int order_id) {
  final file = File("lib/database/order_id.json");
  file.writeAsStringSync('{"order_id": $order_id}');
}

void orderFood(int order_id, List<int> order_items) {
  bool finish_order = false;
  print("What would you like to order?");
  print("Enter item id and quantity (eg: 1 2)");
  print("Type 'done' when you have finished ordering");
  while (!finish_order) {
    var input = stdin.readLineSync();
    if (input == 'done') {
      finish_order = true;
      break;
    }
    order_items.add(int.parse(input!));
  }
  print("Your order: $order_items");
}

void payBill(int order_id, List<int> order_items) {
  Order payment_order = Order(order_id: order_id, order_items: order_items);
  print("Which way would you like to pay?");
  print("\t1. Cash");
  print("\t2. Credit Card");
  print("\t3. KHQR");
  stdout.write("Enter your choice: ");
  final choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      payment_order.payment_method = 'Cash';
      print("You have paid by cash");
      break;
    case 2:
      payment_order.payment_method = 'Credit Card';
      print("You have paid by credit card");
      break;
    case 3:
      $qr_terminal.generate("KHQR ${payment_order.total_price}",
          typeNumber: 1, small: true);
      print("");
      payment_order.payment_method = 'KHQR';
      print("You have paid by KHQR");
      break;
    default:
      print("Invalid choice");
  }
  payment_order.payment_status = true;
  print("Thank you for your payment!");
}
