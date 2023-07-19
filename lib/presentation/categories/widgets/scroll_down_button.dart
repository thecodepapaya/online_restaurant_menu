part of '../view.dart';

class _ScrollDownButton extends StatefulWidget {
  const _ScrollDownButton({super.key});

  @override
  State<_ScrollDownButton> createState() => _ScrollDownButtonState();
}

class _ScrollDownButtonState extends State<_ScrollDownButton> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Timer timer;

  double padding = 0;

  final animationDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();

    final tween = Tween<double>(begin: 8, end: 16);
    controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      reverseDuration: animationDuration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeOut,
    );
    animation = tween.animate(curvedAnimation);

    animation.addListener(() {
      if (controller.isCompleted) {
        timer = Timer(const Duration(milliseconds: 800), () {
          controller.reverse();
        });
      } else if (animation.isDismissed) {
        controller.forward();
      }

      setState(() {
        padding = animation.value;
      });
    });

    controller.forward();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(bottom: padding.toAutoScaledHeightWithContext(context)),
        child: Material(
          elevation: 26,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.only(
              top: 24.toAutoScaledHeightWithContext(context) - padding.toAutoScaledHeightWithContext(context),
              left: 10.toAutoScaledWidthWithContext(context),
              right: 10.toAutoScaledWidthWithContext(context),
              bottom: 12.toAutoScaledHeightWithContext(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 24.toAutoScaledWidthWithContext(context),
                ),
                4.toAutoScaledHeightWithContext(context).toVerticalSpace,
                Text(
                  'Scroll\nDown',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8.toAutoScaledWidthWithContext(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
