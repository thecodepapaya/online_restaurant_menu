part of '../view.dart';

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();
    return Obx(() {
      final selectedMenu = controller.selectedMenu.value;

      final categoriesCount = controller.generateCategoriesMap(selectedMenu).length;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.only(
          top: 24.toAutoScaledHeightWithContext(context),
          bottom: 8.toAutoScaledHeightWithContext(context),
          left: 16.toAutoScaledWidthWithContext(context),
          right: 16.toAutoScaledWidthWithContext(context),
        ),
        child: Text(
          "CATEGORIES ($categoriesCount)",
          style: TextStyle(
            fontSize: 12.toAutoScaledWidthWithContext(context),
            fontWeight: FontWeight.w600,
            color: Color(0xFFA9AAAE),
          ),
        ),
      );
    });
  }
}
