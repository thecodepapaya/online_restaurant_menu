part of '../view.dart';

class MenuType extends StatelessWidget {
  const MenuType({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.toAutoScaledWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MENU TYPE (4)",
            style: TextStyle(
              color: Color(0xFFA9AAAE),
              fontSize: 12.toAutoScaledWidth,
              fontWeight: FontWeight.w600,
            ),
          ),
          16.toAutoScaledHeight.toVerticalSpace,
          _CategoryImage(isSelected: true),
          16.toAutoScaledHeight.toVerticalSpace,
          _CategoryImage(isSelected: false),
          16.toAutoScaledHeight.toVerticalSpace,
        ],
      ),
    );
  }
}
