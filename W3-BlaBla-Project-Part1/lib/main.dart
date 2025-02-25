import 'package:flutter/material.dart';
import 'screens/test/ride_pref_form_test_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const RidePrefFormTestScreen(), // Set the home to RidePrefFormTestScreen
    );
  }
}