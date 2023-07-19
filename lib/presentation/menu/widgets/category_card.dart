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
          left: 16.toAutoScaledWidth,
          right: 16.toAutoScaledWidth,
          bottom: 16.toAutoScaledWidth,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: ValueKey(isInitiallyExpanded),
            initiallyExpanded: isInitiallyExpanded,
            tilePadding: EdgeInsets.symmetric(
              vertical: 0.toAutoScaledHeight,
              horizontal: 16.toAutoScaledWidth,
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
              borderRadius: BorderRadius.circular(12.toAutoScaledWidth),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.toAutoScaledWidth),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 220.toAutoScaledWidth,
                  child: Text(
                    widget.categoryName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.toAutoScaledWidth,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '${widget.entries.length} items',
                  style: TextStyle(
                    fontSize: 12.toAutoScaledWidth,
                    color: const Color(0xFFA9AAAE),
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Divider(
                height: 2,
                color: Color(0xFFE5E6EF),
              ),
              ...widget.entries
                  .asMap()
                  .entries
                  .map(
                    (e) => DishCard(isFirst: e.key == 0, entry: e.value),
                  )
                  .toList(),
            ],
          ),
        ),
      );
    });
  }

  Widget trailingWidget(bool isExpanded) {
    return Container(
      height: 20.toAutoScaledHeight,
      width: 20.toAutoScaledWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.toAutoScaledWidth),
        color: const Color(0xFFE5E6EF),
      ),
      child: Center(
        child: Icon(
          isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
          size: 20,
        ),
      ),
    );
  }
}
