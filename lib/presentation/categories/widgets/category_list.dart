part of '../view.dart';

class _CategoryList extends StatelessWidget {
  const _CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    return Obx(() {
      final selectedMenu = controller.selectedMenu.value;
      final selectedCategory = controller.selectedCategory.value;
      final categoriesMap = controller.generateCategoriesMap(selectedMenu);
      final maxWidth = controller.maxWidth.value;

      return Expanded(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                8.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
                ...categoriesMap.entries
                    .map(
                      (e) => _CategoryTile(
                        value: e.key,
                        selectedValue: selectedCategory,
                        valueCount: e.value,
                      ),
                    )
                    .toList(),
                20.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
              ],
            ),
          ),
        ),
      );
    });
  }
}
