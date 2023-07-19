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
          bottom: 16.toAutoScaledHeightWithParent(maxWidth),
          left: 16.toAutoScaledWidthWithParent(maxWidth),
          right: 16.toAutoScaledWidthWithParent(maxWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/${_meatStatusAsset(dish.meatStatus)}",
                  height: 16.toAutoScaledHeightWithParent(maxWidth),
                  width: 16.toAutoScaledWidthWithParent(maxWidth),
                ),
                8.toAutoScaledWidthWithParent(maxWidth).toHorizontalSpace,
                Text(
                  dish.name,
                  style: TextStyle(
                    fontSize: 16.toAutoScaledWidthWithParent(maxWidth),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            16.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 78.toAutoScaledHeightWithParent(maxWidth),
                minHeight: 78.toAutoScaledHeightWithParent(maxWidth),
              ),
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                    color: Color(0xFFA9AAAE),
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
