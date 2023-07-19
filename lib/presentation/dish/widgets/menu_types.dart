part of '../view.dart';

class MenuType extends StatelessWidget {
  const MenuType({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    final menus = controller.data.description.menus;
    final menuTypeLength = menus.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MENU TYPE ($menuTypeLength)",
            style: TextStyle(
              color: const Color(0xFFA9AAAE),
              fontSize: 12.toAutoScaledWidth,
              fontWeight: FontWeight.w600,
            ),
          ),
          ...menus
              .map(
                (m) => Padding(
                  padding: EdgeInsets.only(top: 16.toAutoScaledHeight),
                  child: _CategoryImage(menu: m),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
