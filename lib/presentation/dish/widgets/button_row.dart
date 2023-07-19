part of '../view.dart';

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final price = controller.dishEntry.sellingPrice;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0,
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.only(
        right: 16.toAutoScaledWidthWithContext(context),
        left: 32.toAutoScaledWidthWithContext(context),
        bottom: 16.toAutoScaledHeightWithContext(context),
        top: 16.toAutoScaledHeightWithContext(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DishCounter(initialCount: 1),
          16.toAutoScaledWidthWithContext(context).toHorizontalSpace,
          InkWell(
            onTap: Get.back,
            child: Container(
              width: 176.toAutoScaledWidthWithContext(context),
              height: 42.toAutoScaledHeightWithContext(context),
              padding: EdgeInsets.symmetric(
                horizontal: 16.toAutoScaledWidthWithContext(context),
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
                      fontSize: 12.toAutoScaledWidthWithContext(context),
                    ),
                  ),
                  Text(
                    "₹$price",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.toAutoScaledWidthWithContext(context),
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
