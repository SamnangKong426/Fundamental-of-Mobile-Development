import 'package:flutter/material.dart';
import 'screen/temperature.dart';
import 'screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isStart = false;

  //create callback to change isState state
  void changeCallBack() {
    setState(() {
      isStart = !isStart;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // pass callback to Welcome widget
          child: (isStart)
              ? const Temperature()
              : Welcome(
                  callBack: changeCallBack,
                ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
