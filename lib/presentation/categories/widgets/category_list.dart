part of '../view.dart';

class _CategoryList extends StatelessWidget {
  const _CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              8.toAutoScaledHeight.toVerticalSpace,
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: true),
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: false),
              _CategoryTile(isSelected: false),
              20.toAutoScaledHeight.toVerticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
