import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: SelectableButton(
            status: "Not selected",
            textLabel: "Not selected",
            textColor: Colors.white,
            bgColor: Colors.grey,
          ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const SelectableButton({
    super.key,
    required this.status,
    required this.textLabel,
    required this.textColor,
    required this.bgColor,
  });

  final String status;
  final String textLabel;
  final Color textColor;
  final Color bgColor;

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  late String status;
  late String textLabel;
  late Color textColor;
  late Color bgColor;

  @override
  void initState() {
    super.initState();
    status = widget.status;
    textLabel = widget.textLabel;
    textColor = widget.textColor;
    bgColor = widget.bgColor;
  }

  void toggleStatus() {
    setState(() {
      if (status == "Not selected") {
        status = "Selected";
        textLabel = "Selected";
        textColor = Colors.white;
        bgColor = Colors.blue;
      } else {
        status = "Not selected";
        textLabel = "Not selected";
        textColor = Colors.black;
        bgColor = Colors.blue.shade50;
      }
    });
  }

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
            style: TextStyle(color: widget.textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
