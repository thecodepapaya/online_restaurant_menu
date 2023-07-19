part of '../view.dart';

class _CategoryTile extends StatelessWidget {
  final String value;
  final String selectedValue;
  final int valueCount;

  const _CategoryTile({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.valueCount,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedValue == value;

    final controller = Get.find<_CategoryController>();

    return InkWell(
      onTap: () {
        controller.onCategoryTilePressed(value);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.toAutoScaledWidthWithContext(context),
          vertical: 4.toAutoScaledHeightWithContext(context),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.toAutoScaledWidthWithContext(context),
          vertical: 12.toAutoScaledHeightWithContext(context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? const Color(0xFFE0E4FF) : Colors.white,
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.1,
              child: Radio(
                fillColor: const MaterialStatePropertyAll(Color(0xFF3D54FF)),
                value: value,
                groupValue: selectedValue,
                onChanged: (_) {},
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            12.toAutoScaledWidthWithContext(context).toHorizontalSpace,
            SizedBox(
              width: 220.toAutoScaledWidthWithContext(context),
              child: Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF3D54FF) : Colors.black,
                  fontSize: 12.toAutoScaledWidthWithContext(context),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "($valueCount)",
              style: TextStyle(
                color: isSelected ? const Color(0xFF3D54FF) : Colors.black,
                fontSize: 12.toAutoScaledWidthWithContext(context),
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
