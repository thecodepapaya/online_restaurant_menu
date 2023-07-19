part of '../view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    final _MenuController controller = Get.find<_MenuController>();

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Color(0xFF121212)),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 20.toAutoScaledWidthWithContext(context),
            vertical: 12.toAutoScaledHeightWithContext(context),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFF121212)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        elevation: const MaterialStatePropertyAll(6),
      ),
      onPressed: controller._navigateToCategoryScreen,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/book_icon.svg",
            height: 16.toAutoScaledHeightWithContext(context),
            width: 16.toAutoScaledWidthWithContext(context),
          ),
          8.toAutoScaledWidthWithContext(context).toHorizontalSpace,
          Text(
            'View Categories',
            style: TextStyle(
              fontSize: 10.toAutoScaledWidthWithContext(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
