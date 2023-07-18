part of 'view.dart';

class _MenuController extends GetxController {
  _MenuController();

  // State variables BEGIN

  Rx<ExplorexData?> data = Rx<ExplorexData?>(null);
  Rx<Menu?> selectedMenu = Rx<Menu?>(null);
  Rx<String?> selectedCategory = Rx<String?>(null);

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
      selectedMenu.value = data.value?.description.menus.first;
      selectedCategory.value = selectedMenu.value?.entries.first.category;
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
        selectedMenu.value = updatedSelection.first;
        selectedCategory.value = updatedSelection.last;
      }
    }
  }
}
