part of '../view.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final List<Entry> entries;

  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.entries,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    return Obx(() {
      final isInitiallyExpanded = controller.selectedCategory.value == widget.categoryName;

      return Padding(
        padding: EdgeInsets.only(
          left: 16.toAutoScaledWidthWithContext(context),
          right: 16.toAutoScaledWidthWithContext(context),
          bottom: 16.toAutoScaledWidthWithContext(context),
        ),
        child: ExpansionTile(
          key: ValueKey(isInitiallyExpanded),
          initiallyExpanded: isInitiallyExpanded,
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(
            vertical: 8.toAutoScaledHeightWithContext(context),
            horizontal: 16.toAutoScaledWidthWithContext(context),
          ),
          trailing: trailingWidget(isExpanded),
          onExpansionChanged: (bool expanded) {
            setState(() {
              isExpanded = expanded;
            });
          },
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: _CategoryListTile(
            categoryName: widget.categoryName,
            categoryCount: widget.entries.length,
          ),
          children: <Widget>[
            const Divider(
              height: 2,
              color: Color(0xFFE5E6EF),
            ),
            ...widget.entries.asMap().entries.map((e) {
              final selectedMeatPref = controller.selectedMeatStatus.value;
              final isMeatPrefEmpty = selectedMeatPref == null;

              if (isMeatPrefEmpty) {
                return DishCard(
                  isFirst: e.key == 0,
                  entry: e.value,
                );
              } else {
                final isMeatPrefMatch = e.value.dish.meatStatus == selectedMeatPref;
                if (isMeatPrefMatch) {
                  return DishCard(
                    isFirst: e.key == 0,
                    entry: e.value,
                  );
                } else {
                  return SizedBox.shrink();
                }
              }
            }).toList(),
          ],
        ),
      );
    });
  }

  Widget trailingWidget(bool isExpanded) {
    return Container(
      height: 20.toAutoScaledHeightWithContext(context),
      width: 20.toAutoScaledWidthWithContext(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFE5E6EF),
      ),
      child: Center(
        child: Icon(
          isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
          size: 20.toAutoScaledWidthWithContext(context),
        ),
      ),
    );
  }
}
