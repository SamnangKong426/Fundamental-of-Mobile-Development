import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8-S1/models/expense.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  late final List<Expense> _registeredExpenses = [
    Expense(
        title: "Ronan The best book",
        amount: 2000.00,
        position: ExpenseType.OTHER),
    Expense(title: "Pizza", amount: 20000.00, position: ExpenseType.FOOD),
    Expense(title: "Tesla", amount: 100000.00, position: ExpenseType.CAR),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: _registeredExpenses.length,
        itemBuilder: (context, index) {
          final expense = _registeredExpenses[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expense.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${expense.amount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        expense.date,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
