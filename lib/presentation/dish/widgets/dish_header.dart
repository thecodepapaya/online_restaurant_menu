part of '../view.dart';

class _DishHeader extends StatelessWidget {
  const _DishHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final description = dish.description?.isEmpty ?? true ? "No description " : dish.description!;

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
          bottom: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledHeightWithParent(maxWidth)
              : 16.toAutoScaledHeightWithParent(maxWidth),
          left: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledWidthWithParent(maxWidth)
              : 16.toAutoScaledWidthWithParent(maxWidth),
          right: ResponsiveDesign.isDesktop
              ? 4.toAutoScaledWidthWithParent(maxWidth)
              : 16.toAutoScaledWidthWithParent(maxWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/${_meatStatusAsset(dish.meatStatus)}",
                  height: ResponsiveDesign.isDesktop
                      ? 4.toAutoScaledHeightWithParent(maxWidth)
                      : 16.toAutoScaledHeightWithParent(maxWidth),
                  width: ResponsiveDesign.isDesktop
                      ? 4.toAutoScaledWidthWithParent(maxWidth)
                      : 16.toAutoScaledWidthWithParent(maxWidth),
                ),
                (ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledWidthWithParent(maxWidth)
                        : 8.toAutoScaledWidthWithParent(maxWidth))
                    .toHorizontalSpace,
                Text(
                  dish.name,
                  style: TextStyle(
                    fontSize: ResponsiveDesign.isDesktop
                        ? 4.toAutoScaledWidthWithParent(maxWidth)
                        : 16.toAutoScaledWidthWithParent(maxWidth),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            (ResponsiveDesign.isDesktop
                    ? 4.toAutoScaledHeightWithParent(maxWidth)
                    : 16.toAutoScaledHeightWithParent(maxWidth))
                .toVerticalSpace,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ResponsiveDesign.isDesktop
                    ? 15.toAutoScaledHeightWithParent(maxWidth)
                    : 78.toAutoScaledHeightWithParent(maxWidth),
                minHeight: ResponsiveDesign.isDesktop
                    ? 15.toAutoScaledHeightWithParent(maxWidth)
                    : 78.toAutoScaledHeightWithParent(maxWidth),
              ),
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: ResponsiveDesign.isDesktop
                        ? 3.toAutoScaledWidthWithParent(maxWidth)
                        : 12.toAutoScaledWidthWithParent(maxWidth),
                    color: const Color(0xFFA9AAAE),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  String _meatStatusAsset(MeatStatus? meatStatus) {
    switch (meatStatus) {
      case MeatStatus.VEG:
        return "veg_icon.svg";
      case MeatStatus.NON_VEG:
        return "non_veg_icon.svg";

      case MeatStatus.VEG_CONTAINS_EGG:
        return "egg_icon.svg";

      case MeatStatus.VEGAN:
        return "vegan_icon.svg";

      case MeatStatus.NA:
      case null:
        return "veg_icon.svg";
    }
  }
}
