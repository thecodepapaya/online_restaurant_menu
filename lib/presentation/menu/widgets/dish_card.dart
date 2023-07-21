part of '../view.dart';

class DishCard extends StatelessWidget {
  final bool isFirst;
  final Entry entry;

  const DishCard({
    super.key,
    required this.isFirst,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.toAutoScaledWidthWithContext(context),
      ),
      child: Column(
        children: [
          if (!isFirst)
            Divider(
              height: 2.toAutoScaledHeightWithContext(context),
              color: Color(0xFFE5E6EF),
            ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.toAutoScaledHeightWithContext(context),
            ),
            child: _CardData(entry: entry),
          ),
        ],
      ),
    );
  }
}

class _CardData extends StatelessWidget {
  final Entry entry;

  const _CardData({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _TextData(entry: entry),
        (ResponsiveDesign.isDesktop
                ? 2.toAutoScaledWidthWithContext(context)
                : 16.toAutoScaledWidthWithContext(context))
            .toHorizontalSpace,
        _ImageData(entry: entry),
      ],
    );
  }
}

class _TextData extends StatelessWidget {
  final Entry entry;

  const _TextData({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    final isDiscounted = entry.displayPrice != entry.sellingPrice;
    final controller = Get.find<OrderMenuController>();

    return InkWell(
      onTap: () {
        controller._navigateToDishScreen(entry);
      },
      child: SizedBox(
        width: ResponsiveDesign.isDesktop
            ? 38.toAutoScaledWidthWithContext(context)
            : 175.toAutoScaledWidthWithContext(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/$_meatStatusAsset",
                  height: ResponsiveDesign.isDesktop
                      ? 4.toAutoScaledHeightWithContext(context)
                      : 16.toAutoScaledHeightWithContext(context),
                  width: ResponsiveDesign.isDesktop
                      ? 4.toAutoScaledWidthWithContext(context)
                      : 16.toAutoScaledWidthWithContext(context),
                ),
                (ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledWidthWithContext(context)
                        : 8.toAutoScaledWidthWithContext(context))
                    .toHorizontalSpace,
                const Likes(),
              ],
            ),
            (ResponsiveDesign.isDesktop
                    ? 3.toAutoScaledHeightWithContext(context)
                    : 12.toAutoScaledHeightWithContext(context))
                .toVerticalSpace,
            Text(
              entry.dish.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ResponsiveDesign.isDesktop
                    ? 3.toAutoScaledWidthWithContext(context)
                    : 14.toAutoScaledWidthWithContext(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            (ResponsiveDesign.isDesktop
                    ? 3.toAutoScaledHeightWithContext(context)
                    : 12.toAutoScaledHeightWithContext(context))
                .toVerticalSpace,
            Text(
              entry.dish.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (ResponsiveDesign.isDesktop
                    ? 2.toAutoScaledWidthWithContext(context)
                    : 10.toAutoScaledWidthWithContext(context)),
                color: const Color(0xFFA9AAAE),
              ),
            ),
            (ResponsiveDesign.isDesktop
                    ? 3.toAutoScaledHeightWithContext(context)
                    : 14.toAutoScaledHeightWithContext(context))
                .toVerticalSpace,
            Row(
              children: [
                Text(
                  "Rs ${entry.sellingPrice}",
                  style: TextStyle(
                    fontSize: ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledWidthWithContext(context)
                        : 10.toAutoScaledWidthWithContext(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                (ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledWidthWithContext(context)
                        : 8.toAutoScaledWidthWithContext(context))
                    .toHorizontalSpace,
                Text(
                  isDiscounted ? "Rs ${entry.displayPrice}" : "",
                  style: TextStyle(
                    fontSize: (ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledWidthWithContext(context)
                        : 10.toAutoScaledWidthWithContext(context)),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get _meatStatusAsset {
    switch (entry.dish.meatStatus) {
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

class _ImageData extends StatelessWidget {
  final Entry entry;

  const _ImageData({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderMenuController>();

    return SizedBox(
      height: ResponsiveDesign.isDesktop
          ? 34.toAutoScaledHeightWithContext(context)
          : 135.toAutoScaledHeightWithContext(context),
      child: Stack(
        children: [
          Positioned(
            left: ResponsiveDesign.isDesktop
                ? 2.toAutoScaledWidthWithContext(context)
                : 10.toAutoScaledWidthWithContext(context),
            top: ResponsiveDesign.isDesktop
                ? 0.toAutoScaledHeightWithContext(context)
                : 0.toAutoScaledHeightWithContext(context),
            child: InkWell(
              onTap: () {
                controller._navigateToDishScreen(entry);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  entry.dish.hasImage ? entry.dish.image! : '',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/no_image.jpeg",
                      height: ResponsiveDesign.isDesktop
                          ? 25.toAutoScaledHeightWithContext(context)
                          : 100.toAutoScaledHeightWithContext(context),
                      width: ResponsiveDesign.isDesktop
                          ? 25.toAutoScaledWidthWithContext(context)
                          : 100.toAutoScaledWidthWithContext(context),
                      fit: BoxFit.cover,
                    );
                  },
                  height: ResponsiveDesign.isDesktop
                      ? 25.toAutoScaledHeightWithContext(context)
                      : 100.toAutoScaledHeightWithContext(context),
                  width: ResponsiveDesign.isDesktop
                      ? 25.toAutoScaledWidthWithContext(context)
                      : 100.toAutoScaledWidthWithContext(context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              final initialCount = controller.cart.value.entries.where((element) => element == entry).length;

              return DishCounter(
                key: ValueKey(initialCount),
                initialCount: initialCount,
                parentMaxWidth: ResponsiveDesign.isDesktop ? Get.size.width / 4 : Get.size.width,
                onCountIncrement: () {
                  controller.addToCart(entry);
                },
                onCountDecrement: () {
                  controller.removeFromCart(entry);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Likes extends StatelessWidget {
  const Likes({super.key});

  @override
  Widget build(BuildContext context) {
    final likes = MATH.Random().nextInt(150) + 5;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4FF),
        borderRadius: BorderRadius.circular(ResponsiveDesign.isDesktop ? 1 : 4),
      ),
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveDesign.isDesktop
            ? 0.5.toAutoScaledHeightWithContext(context)
            : 2.toAutoScaledHeightWithContext(context),
        horizontal: ResponsiveDesign.isDesktop
            ? 1.5.toAutoScaledWidthWithContext(context)
            : 6.toAutoScaledWidthWithContext(context),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/heart_icon.svg",
            height: ResponsiveDesign.isDesktop
                ? 2.toAutoScaledHeightWithContext(context)
                : 8.toAutoScaledHeightWithContext(context),
            width: ResponsiveDesign.isDesktop
                ? 2.toAutoScaledWidthWithContext(context)
                : 8.toAutoScaledWidthWithContext(context),
          ),
          (ResponsiveDesign.isDesktop
                  ? 1.toAutoScaledWidthWithContext(context)
                  : 4.toAutoScaledWidthWithContext(context))
              .toHorizontalSpace,
          Text(
            "$likes",
            style: TextStyle(
              color: const Color(0xFF3D54FF),
              fontSize: ResponsiveDesign.isDesktop
                  ? 2.toAutoScaledWidthWithContext(context)
                  : 9.toAutoScaledWidthWithContext(context),
            ),
          ),
        ],
      ),
    );
  }
}
