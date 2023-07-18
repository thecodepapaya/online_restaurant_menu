part of '../view.dart';

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 24.toAutoScaledHeight,
        bottom: 8.toAutoScaledHeight,
        left: 16.toAutoScaledWidth,
        right: 16.toAutoScaledWidth,
      ),
      child: Text(
        "CATEGORIES (10)",
        style: TextStyle(
          fontSize: 12.toAutoScaledWidth,
          fontWeight: FontWeight.w600,
          color: Color(0xFFA9AAAE),
        ),
      ),
    );
  }
}
