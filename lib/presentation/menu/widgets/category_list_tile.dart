part of '../view.dart';

class _CategoryListTile extends StatelessWidget {
  final String categoryName;
  final int categoryCount;

  const _CategoryListTile({
    super.key,
    required this.categoryName,
    required this.categoryCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            categoryName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ResponsiveDesign.isDesktop
                  ? 4.toAutoScaledWidthWithContext(context)
                  : 12.toAutoScaledWidthWithContext(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '$categoryCount ${"item".toPlural(categoryCount)}',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: ResponsiveDesign.isDesktop
                  ? 4.toAutoScaledWidthWithContext(context)
                  : 12.toAutoScaledWidthWithContext(context),
              color: const Color(0xFFA9AAAE),
            ),
          ),
        ),
      ],
    );
  }
}
