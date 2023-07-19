part of '../view.dart';

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final imageUrl = dish.hasImage ? dish.image! : '';

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.toAutoScaledHeight,
        horizontal: 16.toAutoScaledWidth,
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
              height: 180.toAutoScaledHeight,
              width: 343.toAutoScaledWidth,
              fit: BoxFit.cover,
            );
          },
          height: 180.toAutoScaledHeight,
          width: 343.toAutoScaledWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}