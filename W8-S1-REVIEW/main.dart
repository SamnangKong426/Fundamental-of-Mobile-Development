import 'package:flutter/material.dart';
import 'package:flutter_workspace/W8-S1/screens/expense_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('The best expenses app'),
          backgroundColor: Colors.blue,
        ),
        body: const ExpenseView(),
      ),
    ),
  );
}
