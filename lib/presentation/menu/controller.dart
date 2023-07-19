part of 'view.dart';

class _MenuController extends GetxController {
  _MenuController();

  // State variables BEGIN

  Rx<ExplorexData?> data = Rx<ExplorexData?>(null);
  Rx<Menu?> selectedMenu = Rx<Menu?>(null);
  Rx<String?> selectedCategory = Rx<String?>(null);
  Rx<MeatStatus?> selectedMeatStatus = Rx<MeatStatus?>(null);
  Rx<List<Entry>> recommendedDishes = Rx<List<Entry>>([]);
  Rx<Map<String, List<Entry>>> categorySortedData = Rx<Map<String, List<Entry>>>({});

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

        Scrollable.ensureVisible(GlobalObjectKey(updatedSelection.last).currentContext!);
      }
    }
  }

  void _navigateToDishScreen(Entry dishEntry) async {
    final context = Get.context!;

    Navigator.push(
      context,
      TransparentRoute(
        builder: (BuildContext context) => DishPage(dishEntry: dishEntry),
      ),
    );
  }

  void _updateSelectedMenu({
    required Menu newMenu,
    required String newCategory,
  }) {
    log('CHANGED selectedMenu: ${newMenu.name} selectedCategory: $newCategory', name: '_updateSelectedMenu');
    selectedMenu.value = newMenu;
    selectedCategory.value = newCategory;

    _populateCategoryWiseMenuEntries();

    _populateRecommended();
  }

  void _populateRecommended() {
    final data = <Entry>[];

    selectedMenu.value?.entries.forEach((entry) {
      final isMeatPrefMatch = entry.dish.meatStatus == selectedMeatStatus.value || selectedMeatStatus.value == null;

      if (entry.isRecommended && isMeatPrefMatch) {
        data.add(entry);
      }
    });

    recommendedDishes.value = data;
  }

  void _onSelectMeatStatus(MeatStatus meatStatus) {
    if (selectedMeatStatus.value == meatStatus) {
      // Unselect
      selectedMeatStatus.value = null;
    } else {
      selectedMeatStatus.value = meatStatus;
    }

    _updateSelectedMenu(newMenu: selectedMenu.value!, newCategory: selectedCategory.value!);
  }

  void _filterMeatPreference(MeatStatus meatStatus) {
    final allDishes = List.from(selectedMenu.value?.entries ?? []);

    allDishes.removeWhere((entry) => entry.dish.meatStatus != meatStatus);
  }

  void _populateCategoryWiseMenuEntries() {
    final data = <String, List<Entry>>{};

    final entries = selectedMenu.value?.entries ?? [];

    for (final entry in entries) {
      final hasKey = data.containsKey(entry.category);
      final isMeatPrefMatch = entry.dish.meatStatus == selectedMeatStatus.value || selectedMeatStatus.value == null;

      if (!isMeatPrefMatch) continue;

      if (hasKey) {
        final categoryEntries = data[entry.category];
        categoryEntries!.add(entry);
        data[entry.category] = categoryEntries;
      } else {
        data[entry.category] = [entry];
      }
    }

    categorySortedData.value = data;
  }
}
