part of '../view.dart';

class EAppBar extends StatelessWidget {
  const EAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(vertical: ResponsiveDesign.isDesktop ? 2.toAutoScaledHeight : 12.toAutoScaledHeight),
      child: Image.asset(
        "assets/icons/logo.png",
        width: 86.toAutoScaledWidth,
        height: ResponsiveDesign.isDesktop ? 8.toAutoScaledHeight : 24.toAutoScaledHeight,
      ),
    );
  }
}
