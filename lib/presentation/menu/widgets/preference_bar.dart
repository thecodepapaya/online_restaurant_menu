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
          const PreferenceButton.vegan(),
          const PreferenceButton.veg(),
          const PreferenceButton.nonveg(),
          const PreferenceButton.egg(),
        ],
      ),
    );
  }
}

class PreferenceButton extends StatelessWidget {
  // const PreferenceButton({super.key});

  final String assetPath;
  final String text;
  final MeatStatus status;

  const PreferenceButton.veg()
      : text = 'Veg',
        assetPath = "assets/icons/veg_icon.svg",
        status = MeatStatus.VEG;

  const PreferenceButton.nonveg()
      : text = 'Non Veg',
        assetPath = "assets/icons/non_veg_icon.svg",
        status = MeatStatus.NON_VEG;

  const PreferenceButton.egg()
      : text = 'Egg',
        assetPath = "assets/icons/egg_icon.svg",
        status = MeatStatus.VEG_CONTAINS_EGG;

  const PreferenceButton.vegan()
      : text = 'Vegan',
        assetPath = "assets/icons/vegan_icon.svg",
        status = MeatStatus.VEGAN;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_MenuController>();

    return Obx(() {
      final selectedMeatPref = controller.selectedMeatStatus.value;

      final isSelected = selectedMeatPref == status;

      return Padding(
        padding: EdgeInsets.only(
          top: ResponsiveDesign.isDesktop ? 4.toAutoScaledHeight : 12.toAutoScaledHeight,
          bottom: ResponsiveDesign.isDesktop ? 4.toAutoScaledHeight : 12.toAutoScaledHeight,
          right: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 8.toAutoScaledWidth,
        ),
        child: InkWell(
          onTap: () {
            controller._onSelectMeatStatus(status);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveDesign.isDesktop ? 2.toAutoScaledHeight : 8.toAutoScaledHeight,
              horizontal: ResponsiveDesign.isDesktop ? 2.toAutoScaledWidth : 8.toAutoScaledWidth,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.withOpacity(0.2) : null,
              border: Border.all(
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  assetPath,
                  height: ResponsiveDesign.isDesktop ? 4.toAutoScaledHeight : 12.toAutoScaledHeight,
                  width: ResponsiveDesign.isDesktop ? 4.toAutoScaledWidth : 12.toAutoScaledWidth,
                ),
                4.toHorizontalSpace,
                Text(
                  text,
                  style: TextStyle(
                    fontSize: ResponsiveDesign.isDesktop ? 4.toAutoScaledHeight : 10.toAutoScaledHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
