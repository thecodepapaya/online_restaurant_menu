part of '../view.dart';

class _WebCategoryCard extends StatelessWidget {
  final String category;
  final List<Entry> entries;

  const _WebCategoryCard({
    super.key,
    required this.category,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    return Obx(() {
      final isSelected = category == controller.selectedCategory.value;

      return InkWell(
        onTap: () {
          controller._updateSelectedCategory(newCategory: category);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.toAutoScaledWidthWithContext(context),
            vertical: 2.toAutoScaledHeightWithContext(context),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.withOpacity(0.2) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 2.toAutoScaledHeightWithContext(context),
              horizontal: 4.toAutoScaledWidthWithContext(context),
            ),
            child: _CategoryListTile(
              categoryName: category,
              categoryCount: entries.length,
            ),
          ),
        ),
      );
    });
  }
}
