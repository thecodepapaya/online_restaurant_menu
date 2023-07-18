part of '../view.dart';

class DishCard extends StatelessWidget {
  final bool isFirst;

  const DishCard({
    super.key,
    required this.isFirst,
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
            const Divider(
              height: 2,
              color: Color(0xFFE5E6EF),
            ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.toAutoScaledHeight,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextData(),
                16.toAutoScaledWidth.toHorizontalSpace,
                ImageData(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextData extends StatelessWidget {
  const TextData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.toAutoScaledWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/veg_icon.svg",
                height: 16.toAutoScaledHeight,
                width: 16.toAutoScaledWidth,
              ),
              8.toAutoScaledWidth.toHorizontalSpace,
              Likes(),
            ],
          ),
          12.toAutoScaledHeight.toVerticalSpace,
          Text(
            "Chicken Special Tikka Biryani Morel long",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.toAutoScaledWidth,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.toAutoScaledHeight.toVerticalSpace,
          Text(
            "Some description with incredible length",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.toAutoScaledWidth,
              color: const Color(0xFFA9AAAE),
            ),
          ),
          14.toAutoScaledHeight.toVerticalSpace,
          Row(
            children: [
              Text(
                "Rs 320- 520",
                style: TextStyle(
                  fontSize: 10.toAutoScaledWidth,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.toAutoScaledWidth.toHorizontalSpace,
              Text(
                "Rs 420",
                style: TextStyle(
                  fontSize: 10.toAutoScaledWidth,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageData extends StatelessWidget {
  const ImageData({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.toAutoScaledHeight,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                "https://loremflickr.com/640/360",
                height: 100.toAutoScaledHeight,
                width: 100.toAutoScaledWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  vertical: 5.toAutoScaledHeight,
                  horizontal: 47.toAutoScaledWidth,
                ),
                side: const BorderSide(
                  color: Color(0xFF3D54FF),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 12.toAutoScaledWidth,
                  color: const Color(0xFF3D54FF),
                ),
              ),
            ),
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0E4FF),
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
            "710",
            style: TextStyle(
              color: Color(0xFF3D54FF),
              fontSize: 9.toAutoScaledWidth,
            ),
          ),
        ],
      ),
    );
  }
}
