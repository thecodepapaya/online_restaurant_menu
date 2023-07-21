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
        horizontal: 16.toAutoScaledWidth,
      ),
      child: Column(
        children: [
          if (!isFirst)
            Divider(
              height: 2.toAutoScaledHeight,
              color: Color(0xFFE5E6EF),
            ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.toAutoScaledHeight,
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
        (ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 16.toAutoScaledWidth).toHorizontalSpace,
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
    final controller = Get.find<_MenuController>();

    return InkWell(
      onTap: () {
        controller._navigateToDishScreen(entry);
      },
      child: SizedBox(
        width: ResponsiveDesign.isDesktop ? 38.toAutoScaledWidth : 175.toAutoScaledWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/$_meatStatusAsset",
                  height: ResponsiveDesign.isDesktop ? 4.toAutoScaledHeight : 16.toAutoScaledHeight,
                  width: ResponsiveDesign.isDesktop ? 4.toAutoScaledWidth : 16.toAutoScaledWidth,
                ),
                (ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 8.toAutoScaledWidth).toHorizontalSpace,
                ResponsiveDesign.isDesktop ? const SizedBox.shrink() : const Likes(),
              ],
            ),
            (ResponsiveDesign.isDesktop ? 3.toAutoScaledHeight : 12.toAutoScaledHeight).toVerticalSpace,
            Text(
              entry.dish.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ResponsiveDesign.isDesktop ? 3.toAutoScaledWidth : 14.toAutoScaledWidth,
                fontWeight: FontWeight.w600,
              ),
            ),
            (ResponsiveDesign.isDesktop ? 3.toAutoScaledHeight : 12.toAutoScaledHeight).toVerticalSpace,
            Text(
              entry.dish.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: (ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 10.toAutoScaledWidth),
                color: const Color(0xFFA9AAAE),
              ),
            ),
            (ResponsiveDesign.isDesktop ? 3.toAutoScaledHeight : 14.toAutoScaledHeight).toVerticalSpace,
            Row(
              children: [
                Text(
                  "Rs ${entry.sellingPrice}",
                  style: TextStyle(
                    fontSize: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 10.toAutoScaledWidth,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                (ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 8.toAutoScaledWidth).toHorizontalSpace,
                Text(
                  isDiscounted ? "Rs ${entry.displayPrice}" : "",
                  style: TextStyle(
                    fontSize: (ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 10.toAutoScaledWidth),
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
    final controller = Get.find<_MenuController>();

    return SizedBox(
      height: ResponsiveDesign.isDesktop ? 34.toAutoScaledHeight : 135.toAutoScaledHeight,
      child: Stack(
        children: [
          Positioned(
            left: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 10.toAutoScaledWidth,
            top: ResponsiveDesign.isDesktop ? 0.toAutoScaledHeight : 0.toAutoScaledHeight,
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
                      height: ResponsiveDesign.isDesktop ? 25.toAutoScaledHeight : 100.toAutoScaledHeight,
                      width: ResponsiveDesign.isDesktop ? 25.toAutoScaledWidth : 100.toAutoScaledWidth,
                      fit: BoxFit.cover,
                    );
                  },
                  height: ResponsiveDesign.isDesktop ? 25.toAutoScaledHeight : 100.toAutoScaledHeight,
                  width: ResponsiveDesign.isDesktop ? 25.toAutoScaledWidth : 100.toAutoScaledWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DishCounter(parentMaxWidth: ResponsiveDesign.isDesktop ? Get.size.width / 4 : Get.size.width),
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
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2.toAutoScaledHeight,
        horizontal: 6.toAutoScaledWidth,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/heart_icon.svg",
            height: 8.toAutoScaledHeight,
            width: 8.toAutoScaledWidth,
          ),
          4.toAutoScaledWidth.toHorizontalSpace,
          Text(
            "$likes",
            style: TextStyle(
              color: const Color(0xFF3D54FF),
              fontSize: 9.toAutoScaledWidth,
            ),
          ),
        ],
      ),
    );
  }
}
