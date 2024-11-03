import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                  label: "Submit",
                  icon: Icons.add,
                  iconPosition: IconAlignment.right,
                  type: Button.primary),
              SizedBox(height: 10),
              CustomButton(
                  label: "Time",
                  icon: Icons.access_time,
                  iconPosition: IconAlignment.left,
                  type: Button.secondary),
              SizedBox(height: 10),
              CustomButton(
                  label: "Account",
                  icon: Icons.account_tree_sharp,
                  iconPosition: IconAlignment.right,
                  type: Button.disabled),
            ],
          ),
        ),
      ),
    );
  }
}

enum Button {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;

  const Button(this.color);
}

enum IconAlignment { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconAlignment iconPosition;
  final Button type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconAlignment.left,
    this.type = Button.primary,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: null,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPosition == IconAlignment.left)...[
                Icon(icon),
                const SizedBox(width: 5),
              ],
              Text(label),
              if (iconPosition == IconAlignment.right)...[
                const SizedBox(width: 5),
                Icon(icon),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
