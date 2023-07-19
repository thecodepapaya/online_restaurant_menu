part of '../view.dart';

class RecommendedBar extends StatelessWidget {
  const RecommendedBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    final recommendedCount = controller.recommendedDishes.value.length;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.toAutoScaledHeight,
        horizontal: 16.toAutoScaledWidth,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF7f7f7f).withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recommended in Food Menu',
            style: TextStyle(
              fontSize: 10.toAutoScaledWidth,
              color: const Color(0xFF121212),
            ),
          ),
          Text(
            '($recommendedCount items)',
            style: TextStyle(
              fontSize: 10.toAutoScaledWidth,
              color: const Color(0xFF5a5a5a),
            ),
          ),
        ],
      ),
    );
  }
}
