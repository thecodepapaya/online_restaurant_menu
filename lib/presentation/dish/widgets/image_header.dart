part of '../view.dart';

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final imageUrl = dish.hasImage ? dish.image! : '';

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.toAutoScaledHeightWithParent(maxWidth),
          horizontal: 16.toAutoScaledWidthWithParent(maxWidth),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/no_image.jpeg",
                height: 180.toAutoScaledHeightWithParent(maxWidth),
                width: 343.toAutoScaledWidthWithParent(maxWidth),
                fit: BoxFit.cover,
              );
            },
            height: 180.toAutoScaledHeightWithParent(maxWidth),
            width: 343.toAutoScaledWidthWithParent(maxWidth),
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
