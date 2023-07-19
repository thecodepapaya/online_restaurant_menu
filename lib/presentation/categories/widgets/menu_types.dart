part of '../view.dart';

class MenuType extends StatelessWidget {
  const MenuType({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    final menus = controller.data.description.menus;
    final menuTypeLength = menus.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidthWithContext(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MENU TYPE ($menuTypeLength)",
            style: TextStyle(
              color: const Color(0xFFA9AAAE),
              fontSize: 12.toAutoScaledWidthWithContext(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          ...menus
              .map(
                (m) => Padding(
                  padding: EdgeInsets.only(top: 16.toAutoScaledHeightWithContext(context)),
                  child: _CategoryImage(menu: m),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
