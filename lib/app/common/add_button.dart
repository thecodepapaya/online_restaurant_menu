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
        height: ResponsiveDesign.isDesktop
            ? 10.5.toAutoScaledHeightWithContext(context)
            : 42.toAutoScaledHeightWithContext(context),
        width: ResponsiveDesign.isDesktop
            ? 30.toAutoScaledWidthWithContext(context)
            : 119.toAutoScaledWidthWithContext(context),
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
              fontSize: ResponsiveDesign.isDesktop
                  ? 3.toAutoScaledWidthWithContext(context)
                  : 12.toAutoScaledWidthWithContext(context),
              color: const Color(0xFF3D54FF),
            ),
          ),
        ),
      ),
    );
  }
}
