part of '../view.dart';

class _CloseButton extends StatelessWidget {
  const _CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<_DishController>();

    return IconButton(
      onPressed: Get.back,
      icon: SvgPicture.asset(
        "assets/icons/close_icon.svg",
        height: 24.toAutoScaledHeightWithContext(context),
        width: 24.toAutoScaledWidthWithContext(context),
      ),
    );
  }
}
