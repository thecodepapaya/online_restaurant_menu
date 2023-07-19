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
    final controller = Get.find<_CategoryController>();

    return Obx(() {
      final maxWidth = controller.maxWidth.value;

      return InkWell(
        child: Padding(
          padding: EdgeInsets.only(bottom: padding.toAutoScaledHeightWithParent(maxWidth)),
          child: Material(
            elevation: 26,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.only(
                top: 24.toAutoScaledHeightWithParent(maxWidth) - padding.toAutoScaledHeightWithParent(maxWidth),
                left: 10.toAutoScaledWidthWithParent(maxWidth),
                right: 10.toAutoScaledWidthWithParent(maxWidth),
                bottom: 12.toAutoScaledHeightWithParent(maxWidth),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 24.toAutoScaledWidthWithParent(maxWidth),
                  ),
                  4.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
                  Text(
                    'Scroll\nDown',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8.toAutoScaledWidthWithParent(maxWidth),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
