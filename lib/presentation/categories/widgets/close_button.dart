part of '../view.dart';

class _CloseButton extends StatelessWidget {
  const _CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return IconButton(
        onPressed: controller._returnToMenuScreen,
        icon: SvgPicture.asset(
          "assets/icons/close_icon.svg",
          height: 24.toAutoScaledHeightWithParent(maxWidth),
          width: 24.toAutoScaledWidthWithParent(maxWidth),
        ),
      );
    });
  }
}
