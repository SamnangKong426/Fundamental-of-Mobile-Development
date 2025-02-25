import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum ExpenseType { FOOD, TRAVEL, LEISURE, WORK, CAR, OTHER }

const Uuid uuid = Uuid();
var format = DateFormat.yMd('en_US');

class Expense {
  final String id;
  final String title;
  final double amount;
  final String date;
  final ExpenseType position;

  Expense({required this.title, required this.amount, required this.position})
      : this.id = uuid.v4(),
        this.date = format.format(DateTime.now());
}
