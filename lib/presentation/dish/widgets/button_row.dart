part of '../view.dart';

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final price = controller.dishEntry.sellingPrice;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        right: 16.toAutoScaledWidth,
        left: 32.toAutoScaledWidth,
        bottom: 16.toAutoScaledHeight,
        top: 50.toAutoScaledHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DishCounter(initialCount: 1),
          16.toAutoScaledWidth.toHorizontalSpace,
          InkWell(
            onTap: Get.back,
            child: Container(
              width: 176.toAutoScaledWidth,
              height: 42.toAutoScaledHeight,
              padding: EdgeInsets.symmetric(
                horizontal: 16.toAutoScaledWidth,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF3D54FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.toAutoScaledWidth,
                    ),
                  ),
                  Text(
                    "₹$price",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.toAutoScaledWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
