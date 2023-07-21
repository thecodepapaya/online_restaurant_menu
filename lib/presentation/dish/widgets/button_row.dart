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
          borderRadius: ResponsiveDesign.isDesktop
              ? const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
              : null,
        ),
        padding: EdgeInsets.only(
          right: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledWidthWithParent(maxWidth)
              : 16.toAutoScaledWidthWithParent(maxWidth),
          left: ResponsiveDesign.isDesktop
              ? 8.toAutoScaledWidthWithParent(maxWidth)
              : 32.toAutoScaledWidthWithParent(maxWidth),
          bottom: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledHeightWithParent(maxWidth)
              : 16.toAutoScaledHeightWithParent(maxWidth),
          top: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledHeightWithParent(maxWidth)
              : 16.toAutoScaledHeightWithParent(maxWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DishCounter(
              initialCount: 1,
              parentMaxWidth: ResponsiveDesign.isDesktop ? maxWidth / 4 : maxWidth,
            ),
            (ResponsiveDesign.isDesktop
                    ? 4.toAutoScaledWidthWithParent(maxWidth)
                    : 16.toAutoScaledWidthWithParent(maxWidth))
                .toHorizontalSpace,
            InkWell(
              onTap: Get.back,
              child: Container(
                width: ResponsiveDesign.isDesktop
                    ? 44.toAutoScaledWidthWithParent(maxWidth)
                    : 176.toAutoScaledWidthWithParent(maxWidth),
                height: ResponsiveDesign.isDesktop
                    ? 10.toAutoScaledHeightWithParent(maxWidth)
                    : 42.toAutoScaledHeightWithParent(maxWidth),
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveDesign.isDesktop
                      ? 4.toAutoScaledWidthWithParent(maxWidth)
                      : 16.toAutoScaledWidthWithParent(maxWidth),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3D54FF),
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
                        fontSize: ResponsiveDesign.isDesktop
                            ? 3.toAutoScaledWidthWithParent(maxWidth)
                            : 12.toAutoScaledWidthWithParent(maxWidth),
                      ),
                    ),
                    Text(
                      "₹$price",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveDesign.isDesktop
                            ? 3.toAutoScaledWidthWithParent(maxWidth)
                            : 12.toAutoScaledWidthWithParent(maxWidth),
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
