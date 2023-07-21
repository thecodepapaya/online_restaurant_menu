part of '../view.dart';

class _WebLayout extends StatefulWidget {
  const _WebLayout({super.key});

  @override
  State<_WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<_WebLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    return Obx(() {
      final data = controller.categorySortedData.value;

      final selectedCategory = controller.selectedCategory.value;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: data.entries.map((e) {
                    final isSelected = e.key == controller.selectedCategory.value;

                    return InkWell(
                      onTap: () {
                        controller._updateSelectedCategory(newCategory: e.key);
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
                            categoryName: e.key,
                            categoryCount: e.value.length,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GridView.count(
              childAspectRatio: 2,
              crossAxisCount: 3,
              children: data[selectedCategory] == null
                  ? []
                  : data[selectedCategory]!.map((e) {
                      final selectedMeatPref = controller.selectedMeatStatus.value;
                      final isMeatPrefEmpty = selectedMeatPref == null;

                      if (isMeatPrefEmpty) {
                        return _WebCategoryCard(entry: e);
                      } else {
                        final isMeatPrefMatch = e.dish.meatStatus == selectedMeatPref;
                        if (isMeatPrefMatch) {
                          return _WebCategoryCard(entry: e);
                        } else {
                          return SizedBox.shrink();
                        }
                      }
                    }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
