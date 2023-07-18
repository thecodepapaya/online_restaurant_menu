part of '../view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
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
            horizontal: 24.toAutoScaledWidth,
            vertical: 8.toAutoScaledHeight,
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFF121212)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        elevation: const MaterialStatePropertyAll(6),
      ),
      onPressed: () {
        Navigator.of(context).push(
          TransparentRoute(
            builder: (BuildContext context) => const CategoryPage(),
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/icons/book_icon.svg",
            height: 16.toAutoScaledHeight,
            width: 16.toAutoScaledWidth,
          ),
          8.toHorizontalSpace,
          Text(
            'View Categories',
            style: TextStyle(
              fontSize: 10.toAutoScaledWidth,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
