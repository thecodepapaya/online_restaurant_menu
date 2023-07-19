part of '../view.dart';

class _DishHeader extends StatelessWidget {
  const _DishHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_DishController>();

    final dish = controller.dishEntry.dish;

    final description = dish.description?.isEmpty ?? true ? "No description " : dish.description!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0,
          color: Colors.white,
        ),
      ),
      padding: EdgeInsets.only(
        bottom: 16.toAutoScaledHeightWithContext(context),
        left: 16.toAutoScaledWidthWithContext(context),
        right: 16.toAutoScaledWidthWithContext(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/${_meatStatusAsset(dish.meatStatus)}",
                height: 16.toAutoScaledHeightWithContext(context),
                width: 16.toAutoScaledWidthWithContext(context),
              ),
              8.toAutoScaledWidthWithContext(context).toHorizontalSpace,
              Text(
                dish.name,
                style: TextStyle(
                  fontSize: 16.toAutoScaledWidthWithContext(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          16.toAutoScaledHeightWithContext(context).toVerticalSpace,
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 78.toAutoScaledHeightWithContext(context),
              minHeight: 78.toAutoScaledHeightWithContext(context),
            ),
            child: SingleChildScrollView(
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 12.toAutoScaledWidthWithContext(context),
                  color: Color(0xFFA9AAAE),
                ),
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
        return "vegan_icon.svg";

      case MeatStatus.NA:
      case null:
        return "veg_icon.svg";
    }
  }
}
