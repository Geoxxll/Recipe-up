import 'package:flutter/material.dart';

class AddBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  const AddBtn({
    super.key,
    required this.onPressed,
    this.label = 'Add',
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
