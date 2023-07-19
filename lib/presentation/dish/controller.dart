part of 'view.dart';

class _DishController extends GetxController {
  _DishController({required this.dishEntry});

  final Entry dishEntry;

  RxDouble maxWidth = Get.size.width.obs;

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
  }
}
