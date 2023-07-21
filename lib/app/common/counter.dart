import 'package:explorex/app/common/add_button.dart';
import 'package:explorex/app/responsive.dart';
import 'package:flutter/material.dart';

class DishCounter extends StatefulWidget {
  final int initialCount;
  final double parentMaxWidth;
  final VoidCallback? onCountIncrement;
  final VoidCallback? onCountDecrement;

  const DishCounter({
    super.key,
    this.initialCount = 0,
    required this.parentMaxWidth,
    this.onCountIncrement,
    this.onCountDecrement,
  });

  @override
  State<DishCounter> createState() => _DishCounterState();
}

class _DishCounterState extends State<DishCounter> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _onDecrease() {
    setState(() {
      count--;
    });

    widget.onCountDecrement?.call();
  }

  void _onIncrease() {
    setState(() {
      count++;
    });

    widget.onCountIncrement?.call();
  }

  @override
  Widget build(BuildContext context) {
    final showAddButton = count == 0;

    return showAddButton
        ? AddButton(onPressed: _onIncrease)
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Button.dec(
                onPressed: _onDecrease,
                parentMaxWidth: widget.parentMaxWidth,
              ),
              Container(
                height: 42.toAutoScaledHeightWithParent(widget.parentMaxWidth),
                width: 47.toAutoScaledWidthWithParent(widget.parentMaxWidth),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E4FF),
                  border: Border.all(
                    color: const Color(0xFF3D54FF),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$count',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.toAutoScaledWidthWithParent(widget.parentMaxWidth),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D54FF),
                    ),
                  ),
                ),
              ),
              _Button.inc(
                onPressed: _onIncrease,
                parentMaxWidth: widget.parentMaxWidth,
              ),
            ],
          );
  }
}

class _Button extends StatelessWidget {
  final IconData symbol;
  final VoidCallback onPressed;
  final double parentMaxWidth;

  const _Button.dec({
    super.key,
    required this.onPressed,
    required this.parentMaxWidth,
  }) : symbol = Icons.remove;

  const _Button.inc({
    super.key,
    required this.onPressed,
    required this.parentMaxWidth,
  }) : symbol = Icons.add;

  @override
  Widget build(BuildContext context) {
    final bool isRightSide = symbol == Icons.add;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 42.toAutoScaledHeightWithParent(parentMaxWidth),
        width: 36.toAutoScaledWidthWithParent(parentMaxWidth),
        decoration: BoxDecoration(
          color: const Color(0xFF3D54FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isRightSide ? 0 : 4),
            topRight: Radius.circular(isRightSide ? 4 : 0),
            bottomLeft: Radius.circular(isRightSide ? 0 : 4),
            bottomRight: Radius.circular(isRightSide ? 4 : 0),
          ),
        ),
        child: Icon(
          symbol,
          size: 16.toAutoScaledWidthWithParent(parentMaxWidth),
          color: Colors.white,
        ),
      ),
    );
  }
}
