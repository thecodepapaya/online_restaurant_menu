part of '../view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    final _MenuController controller = Get.find<_MenuController>();

    return Obx(() {
      final showCartBanner = controller.cart.value.entries.isNotEmpty;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _CategoryFabButton(),
          if (showCartBanner) const _OrderButton(),
        ],
      );
    });
  }
}

class _CategoryFabButton extends StatelessWidget {
  const _CategoryFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _MenuController controller = Get.find<_MenuController>();

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Color(0xFF121212)),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: ResponsiveDesign.isDesktop
                ? 5.toAutoScaledWidthWithContext(context)
                : 20.toAutoScaledWidthWithContext(context),
            vertical: ResponsiveDesign.isDesktop
                ? 4.toAutoScaledHeightWithContext(context)
                : 12.toAutoScaledHeightWithContext(context),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFF121212)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        elevation: const MaterialStatePropertyAll(6),
      ),
      onPressed: controller._navigateToCategoryScreen,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/book_icon.svg",
            height: ResponsiveDesign.isDesktop
                ? 4.toAutoScaledHeightWithContext(context)
                : 16.toAutoScaledHeightWithContext(context),
            width: ResponsiveDesign.isDesktop
                ? 4.toAutoScaledWidthWithContext(context)
                : 16.toAutoScaledWidthWithContext(context),
          ),
          (ResponsiveDesign.isDesktop
                  ? 3.toAutoScaledWidthWithContext(context)
                  : 8.toAutoScaledWidthWithContext(context))
              .toHorizontalSpace,
          Text(
            'View Categories',
            style: TextStyle(
              fontSize: ResponsiveDesign.isDesktop
                  ? 4.toAutoScaledWidthWithContext(context)
                  : 10.toAutoScaledWidthWithContext(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderButton extends StatelessWidget {
  const _OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _MenuController controller = Get.find<_MenuController>();

    return Obx(() {
      final cartEntries = controller.cart.value.entries;

      var price = 0.0;
      for (var element in cartEntries) {
        price += element.sellingPrice;
      }

      return ShowUpAnimation(
        animationDuration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.toAutoScaledWidth,
            vertical: 16.toAutoScaledHeight,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.toAutoScaledWidth,
              vertical: 12.toAutoScaledHeight,
            ),
            height: 68.toAutoScaledHeight,
            width: 359.toAutoScaledWidth,
            decoration: BoxDecoration(
              color: Color(0xFF1B2DAF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rs $price",
                      style: TextStyle(
                        fontSize: 16.toAutoScaledWidth,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${cartEntries.length} items",
                      style: TextStyle(
                        fontSize: 9.toAutoScaledWidth,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.toAutoScaledHeight,
                      horizontal: 16.toAutoScaledWidth,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 20.toAutoScaledWidth,
                          color: Color(0xFF3D54FF),
                        ),
                        8.toAutoScaledWidth.toHorizontalSpace,
                        Text(
                          "View and order",
                          style: TextStyle(
                            fontSize: 12.toAutoScaledWidth,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3D54FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
