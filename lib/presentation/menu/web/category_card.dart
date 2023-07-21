part of '../view.dart';

class _WebCategoryCard extends StatelessWidget {
  final Entry entry;

  const _WebCategoryCard({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 4.toAutoScaledWidth,
        vertical: 2.toAutoScaledHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 4.toAutoScaledWidth,
        vertical: 2.toAutoScaledHeight,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: _CardData(
        key: ValueKey(entry.dish.name),
        entry: entry,
      ),
    );
  }
}
