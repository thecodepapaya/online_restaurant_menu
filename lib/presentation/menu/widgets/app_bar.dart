part of '../view.dart';

class EAppBar extends StatelessWidget {
  const EAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: ResponsiveDesign.isDesktop
              ? 2.toAutoScaledHeightWithContext(context)
              : 12.toAutoScaledHeightWithContext(context)),
      child: Image.asset(
        "assets/icons/logo.png",
        width: 86.toAutoScaledWidthWithContext(context),
        height: ResponsiveDesign.isDesktop
            ? 8.toAutoScaledHeightWithContext(context)
            : 24.toAutoScaledHeightWithContext(context),
      ),
    );
  }
}
