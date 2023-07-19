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

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return InkWell(
        onTap: () {
          controller.onCategoryTilePressed(value);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16.toAutoScaledWidthWithParent(maxWidth),
            vertical: 4.toAutoScaledHeightWithParent(maxWidth),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.toAutoScaledWidthWithParent(maxWidth),
            vertical: 12.toAutoScaledHeightWithParent(maxWidth),
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
              12.toAutoScaledWidthWithParent(maxWidth).toHorizontalSpace,
              SizedBox(
                width: 220.toAutoScaledWidthWithParent(maxWidth),
                child: Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF3D54FF) : Colors.black,
                    fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "($valueCount)",
                style: TextStyle(
                  color: isSelected ? const Color(0xFF3D54FF) : Colors.black,
                  fontSize: 12.toAutoScaledWidthWithParent(maxWidth),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
