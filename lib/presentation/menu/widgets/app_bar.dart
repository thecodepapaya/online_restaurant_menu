part of '../view.dart';

class EAppBar extends StatelessWidget {
  const EAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.toAutoScaledHeight),
      child: Image.asset(
        "assets/icons/logo.png",
        width: 86.toAutoScaledWidth,
        height: 24.toAutoScaledHeight,
      ),
    );
  }
}
