part of '../view.dart';

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final price = controller.dishEntry.sellingPrice;

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0,
            color: Colors.white,
          ),
        ),
        padding: EdgeInsets.only(
          right: 16.toAutoScaledWidthWithParent(maxWidth),
          left: 32.toAutoScaledWidthWithParent(maxWidth),
          bottom: 16.toAutoScaledHeightWithParent(maxWidth),
          top: 16.toAutoScaledHeightWithParent(maxWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DishCounter(initialCount: 1, parentMaxWidth: maxWidth),
            16.toAutoScaledWidthWithParent(maxWidth).toHorizontalSpace,
            InkWell(
              onTap: Get.back,
              child: Container(
                width: 176.toAutoScaledWidthWithParent(maxWidth),
                height: 42.toAutoScaledHeightWithParent(maxWidth),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.toAutoScaledWidthWithParent(maxWidth),
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
                        fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                      ),
                    ),
                    Text(
                      "₹$price",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
