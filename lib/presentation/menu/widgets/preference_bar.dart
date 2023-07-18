part of '../view.dart';

class PreferenceBar extends StatelessWidget {
  const PreferenceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          16.toAutoScaledWidth.toHorizontalSpace,
          PreferenceButton.veg(),
          PreferenceButton.nonveg(),
          PreferenceButton.egg(),
        ],
      ),
    );
  }
}

class PreferenceButton extends StatelessWidget {
  // const PreferenceButton({super.key});

  final String assetPath;
  final String text;

  const PreferenceButton.veg()
      : text = 'Veg',
        assetPath = "assets/icons/veg_icon.svg";

  const PreferenceButton.nonveg()
      : text = 'Non Veg',
        assetPath = "assets/icons/non_veg_icon.svg";

  const PreferenceButton.egg()
      : text = 'Egg',
        assetPath = "assets/icons/egg_icon.svg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12.toAutoScaledHeight,
        bottom: 12.toAutoScaledHeight,
        right: 8.toAutoScaledWidth,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.toAutoScaledHeight,
            horizontal: 8.toAutoScaledWidth,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(4.toAutoScaledWidth),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                assetPath,
                height: 12.toAutoScaledHeight,
                width: 12.toAutoScaledWidth,
              ),
              4.toHorizontalSpace,
              Text(
                text,
                style: TextStyle(
                  fontSize: 10.toAutoScaledHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
