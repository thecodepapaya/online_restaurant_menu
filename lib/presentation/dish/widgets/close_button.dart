part of '../view.dart';

class _CloseButton extends StatelessWidget {
  const _CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return IconButton(
        onPressed: Get.back,
        icon: SvgPicture.asset(
          "assets/icons/close_icon.svg",
          height: ResponsiveDesign.isDesktop
              ? 6.toAutoScaledHeightWithParent(maxWidth)
              : 24.toAutoScaledHeightWithParent(maxWidth),
          width: ResponsiveDesign.isDesktop
              ? 6.toAutoScaledWidthWithParent(maxWidth)
              : 24.toAutoScaledWidthWithParent(maxWidth),
        ),
      );
    });
  }
}
