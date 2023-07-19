part of '../view.dart';

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final imageUrl = dish.hasImage ? dish.image! : '';

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/drinks_food.jpg",
            height: 180.toAutoScaledHeight,
            width: 343.toAutoScaledWidth,
            fit: BoxFit.cover,
          );
        },
        height: 180.toAutoScaledHeight,
        width: 343.toAutoScaledWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
