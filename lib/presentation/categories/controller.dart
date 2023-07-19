part of 'view.dart';

class _CategoryController extends GetxController {
  _CategoryController({
    required this.data,
    required this.oldSelectedMenu,
    required this.oldSelectedCategory,
  });

  final Menu oldSelectedMenu;
  final String oldSelectedCategory;

  // State variables BEGIN
  ExplorexData data;
  late Rx<Menu> selectedMenu;
  late Rx<String> selectedCategory;
  // State variables END

  bool get hasData => data.code == 0;

  @override
  void onReady() {
    log('onReady');
  }

  @override
  void onClose() {
    log('onClose');
  }

  @override
  void onInit() {
    super.onInit();
    log('onInit');

    selectedMenu = oldSelectedMenu.obs;
    selectedCategory = oldSelectedCategory.obs;
  }

  Future<bool> _returnToMenuScreen() async {
    final context = Get.context!;

    Future.delayed(Duration(milliseconds: 10), () {
      Navigator.of(context).pop([selectedMenu.value, selectedCategory.value]);
    });

    return Future.value(false);
  }

  void onMenuTapped(Menu menu) {
    selectedMenu.value = menu;

    selectedCategory.value = menu.entries.first.category;
  }

  // TODO
  Map<String, int> generateCategoriesMap(Menu menu) {
    final data = <String, int>{};

    menu.entries.forEach(
      (entry) {
        final categoryExists = data.containsKey(entry.category);

        if (categoryExists) {
          final count = data[entry.category]!;
          data[entry.category] = count + 1;
        } else {
          data[entry.category] = 1;
        }
      },
    );

    return data;
  }

  void onCategoryTilePressed(String category) {
    selectedCategory.value = category;

    _returnToMenuScreen();
  }

  // List<String> getCategoriesList(Menu menu) {
  //   final categoriesSet = <String>{};

  //   menu.entries.forEach((entry) {
  //     categoriesSet.add(entry.category);
  //   });

  //   return categoriesSet.toList();
  // }
}
