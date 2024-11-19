import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  double? _fahrenhei;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'Enter a temperature',
      hintStyle: const TextStyle(color: Colors.white));

  final degreeInput = TextEditingController();

  double degreeToFar(double degree) {
    return degree * (9 / 5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Temperature in Degrees:"),
          const SizedBox(height: 10),
          TextField(
            controller: degreeInput,
            decoration: inputDecoration,
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              setState(() {
                _fahrenhei = degreeToFar(double.parse(value));
              });
            },
          ),
          const SizedBox(height: 30),
          const Text("Temperature in Fahrenheit:"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: textDecoration,
            child: Text(_fahrenhei == null
                ? "Please enter a valid value above."
                : _fahrenhei!.toStringAsFixed(2)),
          )
        ],
      )),
    );
  }
}
