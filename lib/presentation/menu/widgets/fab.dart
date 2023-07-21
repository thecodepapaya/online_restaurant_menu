part of '../view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderMenuController controller = Get.find<OrderMenuController>();

    return Obx(() {
      final showCartBanner = controller.cart.value.entries.isNotEmpty && !ResponsiveDesign.isDesktop;

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
    final OrderMenuController controller = Get.find<OrderMenuController>();

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
    final OrderMenuController controller = Get.find<OrderMenuController>();

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
            horizontal: ResponsiveDesign.isDesktop ? 1.toAutoScaledWidth : 8.toAutoScaledWidth,
            vertical: ResponsiveDesign.isDesktop ? 3.toAutoScaledHeight : 16.toAutoScaledHeight,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveDesign.isDesktop ? 3.toAutoScaledWidth : 16.toAutoScaledWidth,
              vertical: ResponsiveDesign.isDesktop ? 2.toAutoScaledHeight : 12.toAutoScaledHeight,
            ),
            height: ResponsiveDesign.isDesktop ? 12.toAutoScaledHeight : 68.toAutoScaledHeight,
            width: ResponsiveDesign.isDesktop ? 55.toAutoScaledWidth : 359.toAutoScaledWidth,
            decoration: BoxDecoration(
              color: Color(0xFF1B2DAF),
              borderRadius: BorderRadius.circular(ResponsiveDesign.isDesktop ? 6 : 8),
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
                        fontSize: ResponsiveDesign.isDesktop ? 3.toAutoScaledWidth : 16.toAutoScaledWidth,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${cartEntries.length} ${"item".toPlural(cartEntries.length)}",
                      style: TextStyle(
                        fontSize: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 9.toAutoScaledWidth,
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
                      borderRadius: BorderRadius.circular(ResponsiveDesign.isDesktop ? 6 : 8),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ResponsiveDesign.isDesktop ? 2.toAutoScaledHeight : 12.toAutoScaledHeight,
                      horizontal: ResponsiveDesign.isDesktop ? 3.toAutoScaledWidth : 16.toAutoScaledWidth,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: ResponsiveDesign.isDesktop ? 3.toAutoScaledWidth : 20.toAutoScaledWidth,
                          color: Color(0xFF3D54FF),
                        ),
                        (ResponsiveDesign.isDesktop ? 1.toAutoScaledWidth : 8.toAutoScaledWidth).toHorizontalSpace,
                        Text(
                          "View & Order",
                          style: TextStyle(
                            fontSize: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 12.toAutoScaledWidth,
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
