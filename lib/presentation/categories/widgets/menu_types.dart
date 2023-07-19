part of '../view.dart';

class MenuType extends StatelessWidget {
  const MenuType({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    final menus = controller.data.description.menus;
    final menuTypeLength = menus.length;

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidthWithParent(maxWidth)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MENU TYPE ($menuTypeLength)",
              style: TextStyle(
                color: const Color(0xFFA9AAAE),
                fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                fontWeight: FontWeight.w600,
              ),
            ),
            ...menus
                .map(
                  (m) => Padding(
                    padding: EdgeInsets.only(top: 16.toAutoScaledHeightWithParent(maxWidth)),
                    child: _CategoryImage(menu: m),
                  ),
                )
                .toList(),
          ],
        ),
      );
    });
  }
}
