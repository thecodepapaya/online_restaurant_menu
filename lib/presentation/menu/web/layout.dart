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
    final controller = Get.find<OrderMenuController>();

    return Obx(() {
      final data = controller.categorySortedData.value;

      final selectedCategory = controller.selectedCategory.value;

      final recommendedDished = controller.recommendedDishes.value;

      final isRecommendedSelected = controller.selectedCategory.value == "Recommended";

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
                  children: [
                    _WebCategoryCard(
                      category: 'Recommended',
                      entries: recommendedDished,
                    ),
                    ...data.entries.map((e) {
                      return _WebCategoryCard(category: e.key, entries: e.value);
                    })
                  ].toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GridView.count(
              childAspectRatio: 2,
              crossAxisCount: 3,
              children: isRecommendedSelected
                  ? recommendedDished.map((e) => _WebDishCard(entry: e)).toList()
                  : data[selectedCategory] == null
                      ? []
                      : data[selectedCategory]!.map((e) => _WebDishCard(entry: e)).toList(),
            ),
          ),
        ],
      );
    });
  }
}
