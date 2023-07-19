part of 'view.dart';

class _MenuController extends GetxController {
  _MenuController();

  // State variables BEGIN

  Rx<ExplorexData?> data = Rx<ExplorexData?>(null);
  Rx<Menu?> selectedMenu = Rx<Menu?>(null);
  Rx<String?> selectedCategory = Rx<String?>(null);
  Rx<List<Entry>> recommendedDishes = Rx<List<Entry>>([]);

  // State variables END

  bool get isDataLoading => data.value == null;
  bool get hasData => !isDataLoading && data.value?.code == 0;

  @override
  void onReady() {
    log('onReady');
  }

  @override
  void onClose() {
    log('onClose');
  }

  @override
  void onInit() async {
    super.onInit();
    log('onInit');

    await _getData();

    if (hasData) {
      final initialMenu = data.value!.description.menus.first;
      final initialCategory = initialMenu.entries.first.category;

      _updateSelectedMenu(newMenu: initialMenu, newCategory: initialCategory);
      _populateRecommended();
    }
  }

  Future<void> _getData() async {
    log('_getData');

    data.value = await DataRepository.getJsonDecodedData();
  }

  void _navigateToCategoryScreen() async {
    final context = Get.context;

    final canProceed = context != null && hasData;

    if (canProceed) {
      final updatedSelection = await Navigator.push<List>(
        context,
        TransparentRoute(
          builder: (BuildContext context) => CategoryPage(
            data: data.value!,
            selectedCategory: selectedCategory.value!,
            selectedMenu: selectedMenu.value!,
          ),
        ),
      );

      if (updatedSelection != null) {
        _updateSelectedMenu(newMenu: updatedSelection.first, newCategory: updatedSelection.last);

        Scrollable.ensureVisible(
          GlobalObjectKey(updatedSelection.last).currentContext!,
          // alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
          // alignment: 200,
        );
      }
    }
  }

  void _updateSelectedMenu({
    required Menu newMenu,
    required String newCategory,
  }) {
    log('CHANGED selectedMenu: ${newMenu.name} selectedCategory: $newCategory', name: '_updateSelectedMenu');
    selectedMenu.value = newMenu;
    selectedCategory.value = newCategory;

    selectedMenu.value?.populateCategoryWiseMenuEntries();
  }

  void _populateRecommended() {
    final data = <Entry>[];

    selectedMenu.value?.entries.forEach((entry) {
      if (entry.isRecommended) {
        data.add(entry);
      }
    });

    recommendedDishes.value = data;
  }
}
