import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            children: [
              SelectableButton(
                status: false,
              ),
              SizedBox(height: 10),
              SelectableButton(
                status: true,
              ),
              SizedBox(height: 10),
              SelectableButton(
                status: false,
              ),
              SizedBox(height: 10),
              SelectableButton(
                status: true,
              ),
            ],
          ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const SelectableButton({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;
  
  void toggleStatus() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get textLabel => isSelected ? 'Selected' : 'Not selected';
  Color? get textColor => isSelected ? Colors.white : Colors.black;
  Color? get bgColor => isSelected ? Colors.blue[500] : Colors.blue[50];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        onPressed: toggleStatus,
        child: Center(
          child: Text(
            textLabel,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
