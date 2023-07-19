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
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 42.toAutoScaledHeight,
        width: 119.toAutoScaledWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFF3D54FF),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
              fontSize: 12.toAutoScaledWidth,
              color: const Color(0xFF3D54FF),
            ),
          ),
        ),
      ),
    );

    // return ElevatedButton(
    //   onPressed: onPressed,
    //   style: OutlinedButton.styleFrom(
    //     elevation: 0,
    //     fixedSize: Size(119.toAutoScaledWidth, 42.toAutoScaledHeight),
    //     padding: EdgeInsets.zero,
    //     side: const BorderSide(
    //       color: Color(0xFF3D54FF),
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(4),
    //     ),
    //   ),
    //   child: Text(
    //     'Add',
    //     style: TextStyle(
    //       fontSize: 12.toAutoScaledWidth,
    //       color: const Color(0xFF3D54FF),
    //     ),
    //   ),
    // );
  }
}
