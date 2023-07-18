part of '../view.dart';

class _CategoryTile extends StatelessWidget {
  final bool isSelected;

  const _CategoryTile({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.toAutoScaledWidth,
        vertical: 4.toAutoScaledHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.toAutoScaledWidth,
        vertical: 12.toAutoScaledHeight,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Color(0xFFE0E4FF) : Colors.white,
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.1,
            child: Radio(
              fillColor: MaterialStatePropertyAll(Color(0xFF3D54FF)),
              value: 'groupValue',
              groupValue: 'groupValue',
              onChanged: (_) {},
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          12.toAutoScaledWidth.toHorizontalSpace,
          Text(
            "Non veg Starter",
            style: TextStyle(
              color: isSelected ? Color(0xFF3D54FF) : Colors.black,
              fontSize: 12.toAutoScaledWidth,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            "(5)",
            style: TextStyle(
              color: isSelected ? Color(0xFF3D54FF) : Colors.black,
              fontSize: 12.toAutoScaledWidth,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
