import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback onPressed;

  const BlaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon, color: isPrimary ? Colors.white : BlaColors.primary) : Container(),
      label: Text(
        text,
        style: TextStyle(
          color: isPrimary ? Colors.white : BlaColors.primary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? BlaColors.primary : Colors.white,
        side: BorderSide(color: BlaColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}