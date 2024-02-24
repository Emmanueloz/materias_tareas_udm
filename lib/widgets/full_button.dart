import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color color;
  final VoidCallback? onPressed;
  const FullButton({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
