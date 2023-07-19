import 'package:explorex/app/common/add_button.dart';
import 'package:explorex/app/responsive.dart';
import 'package:flutter/material.dart';

class DishCounter extends StatefulWidget {
  final int initialCount;

  const DishCounter({
    super.key,
    this.initialCount = 0,
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
  }

  void _onIncrease() {
    setState(() {
      count++;
    });
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
              _Button.dec(onPressed: _onDecrease),
              Container(
                height: 42.toAutoScaledHeight,
                width: 47.toAutoScaledWidth,
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
                      fontSize: 12.toAutoScaledWidth,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D54FF),
                    ),
                  ),
                ),
              ),
              _Button.inc(onPressed: _onIncrease),
            ],
          );
  }
}

class _Button extends StatelessWidget {
  final IconData symbol;
  final VoidCallback onPressed;

  const _Button.dec({super.key, required this.onPressed}) : symbol = Icons.remove;

  const _Button.inc({super.key, required this.onPressed}) : symbol = Icons.add;

  @override
  Widget build(BuildContext context) {
    final bool isRightSide = symbol == Icons.add;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 42.toAutoScaledHeight,
        width: 36.toAutoScaledWidth,
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
          size: 16.toAutoScaledWidth,
          color: Colors.white,
        ),
      ),
    );
  }
}
