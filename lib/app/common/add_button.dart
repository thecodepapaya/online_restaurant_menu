import 'package:explorex/app/responsive.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 5.toAutoScaledHeight,
          horizontal: 47.toAutoScaledWidth,
        ),
        side: const BorderSide(
          color: Color(0xFF3D54FF),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        'Add',
        style: TextStyle(
          fontSize: 12.toAutoScaledWidth,
          color: const Color(0xFF3D54FF),
        ),
      ),
    );
  }
}
