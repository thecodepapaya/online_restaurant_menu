part of '../view.dart';

class _CloseButton extends StatelessWidget {
  const _CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        "assets/icons/close_icon.svg",
        height: 24.toAutoScaledHeight,
        width: 24.toAutoScaledWidth,
      ),
    );
  }
}
