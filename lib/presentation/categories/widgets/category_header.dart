part of '../view.dart';

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();
    return Obx(() {
      final selectedMenu = controller.selectedMenu.value;

      final categoriesCount = controller.generateCategoriesMap(selectedMenu).length;

      return Obx(() {
        final maxWidth = controller.maxWidth.value;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0,
              color: Colors.white,
            ),
          ),
          padding: EdgeInsets.only(
            top: 24.toAutoScaledHeightWithParent(maxWidth),
            bottom: 8.toAutoScaledHeightWithParent(maxWidth),
            left: 16.toAutoScaledWidthWithParent(maxWidth),
            right: 16.toAutoScaledWidthWithParent(maxWidth),
          ),
          child: Text(
            "CATEGORIES ($categoriesCount)",
            style: TextStyle(
              fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
              fontWeight: FontWeight.w600,
              color: Color(0xFFA9AAAE),
            ),
          ),
        );
      });
    });
  }
}
