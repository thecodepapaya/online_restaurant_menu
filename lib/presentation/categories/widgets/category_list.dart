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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: ResponsiveDesign.isDesktop
                ? const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
                : null,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResponsiveDesign.isDesktop
                    ? 2.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace
                    : 8.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
                ...categoriesMap.entries
                    .map(
                      (e) => _CategoryTile(
                        value: e.key,
                        selectedValue: selectedCategory,
                        valueCount: e.value,
                      ),
                    )
                    .toList(),
                ResponsiveDesign.isDesktop
                    ? 4.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace
                    : 20.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
              ],
            ),
          ),
        ),
      );
    });
  }
}
