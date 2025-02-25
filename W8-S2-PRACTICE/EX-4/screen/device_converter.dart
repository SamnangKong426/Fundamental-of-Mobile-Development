import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Device { EURO, RIELS, DONG }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  late TextEditingController _amountController;
  Device selectedDevice = Device.values.first;

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void updateSelectedDevice(Device device) {
    setState(() {
      selectedDevice = device;
    });
  }

  double _convertAmount() {
    switch (selectedDevice) {
      case Device.EURO:
        return double.parse(_amountController.text) * 0.95;
      case Device.RIELS:
        return double.parse(_amountController.text) * 4032.60;
      case Device.DONG:
        return double.parse(_amountController.text) * 25405.02;
      default:
        throw Exception('Unsupported device type: $selectedDevice');
    }
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
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                prefix: const Text('\$ '),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter an amount in dollars',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            const Text("Device:"),
            DropdownButtonExample(
              selectedDevice: selectedDevice,
              onDeviceChanged: updateSelectedDevice,
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: _amountController.text.isNotEmpty
                  ? Text(
                      _convertAmount().toStringAsFixed(2),
                      style: const TextStyle(color: Colors.black),
                    )
                  : const Text(
                      'Enter an amount to convert',
                      style: TextStyle(color: Colors.black),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatelessWidget {
  final Device selectedDevice;
  final ValueChanged<Device> onDeviceChanged;

  const DropdownButtonExample({
    super.key,
    required this.selectedDevice,
    required this.onDeviceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Device>(
      value: selectedDevice,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (Device? newValue) {
        if (newValue != null) {
          onDeviceChanged(newValue);
        }
      },
      items: Device.values.map<DropdownMenuItem<Device>>((Device value) {
        return DropdownMenuItem<Device>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
