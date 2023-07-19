part of '../view.dart';

class _DishHeader extends StatelessWidget {
  const _DishHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final description = dish.description?.isEmpty ?? true ? "No description" : dish.description!;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        bottom: 16.toAutoScaledHeight,
        left: 16.toAutoScaledWidth,
        right: 16.toAutoScaledWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/${_meatStatusAsset(dish.meatStatus)}",
                height: 16.toAutoScaledHeight,
                width: 16.toAutoScaledWidth,
              ),
              8.toAutoScaledWidth.toHorizontalSpace,
              Text(
                dish.name,
                style: TextStyle(
                  fontSize: 16.toAutoScaledWidth,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          16.toAutoScaledHeight.toVerticalSpace,
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100.toAutoScaledHeight),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12.toAutoScaledWidth,
                color: Color(0xFFA9AAAE),
              ),
            ),
          ),
        ],
      ),
    );
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
        return "veg_icon.svg";

      case MeatStatus.NA:
      case null:
        return "veg_icon.svg";
    }
  }
}
