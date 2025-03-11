import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/count_notifier.dart';
import 'screen/home.dart';

// 2. Provide the model to the app root widget using a ChangeNotifierProvider
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}
