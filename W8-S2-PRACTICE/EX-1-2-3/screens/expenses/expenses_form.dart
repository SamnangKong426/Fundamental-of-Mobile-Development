import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.values.first;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void updateSelectedDevice(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: _selectedDate!, //  TODO :  For now it s a fake data
        category: _selectedCategory); //  TODO :  For now it s a fake data

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> _presentDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _selectedDate != null
                      ? DateFormat.yMEd().format(_selectedDate!)
                      : "No date selected",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month_sharp),
                onPressed: _presentDatePicker,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add a drop-down button to select the category
              Align(
                alignment: Alignment.centerLeft,
                child: DropdownButtonExample(
                  dropdownValue: _selectedCategory,
                  onCategoryChanged: updateSelectedDevice,
                ),
              ),
              const Spacer(),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}

class DropdownButtonExample extends StatelessWidget {
  final Category dropdownValue;
  final ValueChanged<Category> onCategoryChanged;

  const DropdownButtonExample(
      {super.key,
      required this.dropdownValue,
      required this.onCategoryChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (Category? newValue) {
        // This is called when the user selects an item.
        if (newValue != null) {
          onCategoryChanged(newValue);
        }
      },
      items: Category.values.map<DropdownMenuItem<Category>>((Category value) {
        return DropdownMenuItem<Category>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
