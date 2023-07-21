part of '../view.dart';

class RecommendedBar extends StatelessWidget {
  const RecommendedBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveDesign.isDesktop
            ? 2.toAutoScaledHeightWithContext(context)
            : 8.toAutoScaledHeightWithContext(context),
        horizontal: 16.toAutoScaledWidthWithContext(context),
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
              fontSize: ResponsiveDesign.isDesktop
                  ? 4.toAutoScaledWidthWithContext(context)
                  : 10.toAutoScaledWidthWithContext(context),
              color: const Color(0xFF121212),
            ),
          ),
          Obx(() {
            final recommendedCount = controller.recommendedDishes.value.length;

            return Text(
              '($recommendedCount items)',
              style: TextStyle(
                fontSize: ResponsiveDesign.isDesktop
                    ? 4.toAutoScaledWidthWithContext(context)
                    : 10.toAutoScaledWidthWithContext(context),
                color: const Color(0xFF5a5a5a),
              ),
            );
          }),
        ],
      ),
    );
  }
}
