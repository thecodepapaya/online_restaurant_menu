part of '../view.dart';

class _CategoryImage extends StatelessWidget {
  final Menu menu;

  const _CategoryImage({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<_CategoryController>();

    return Obx(
      () {
        final selectedMenu = controller.selectedMenu;
        final isSelected = selectedMenu.value.id == menu.id;

        return InkWell(
          onTap: () {
            controller.onMenuTapped(menu);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? const Color(0xFF3D54FF) : Colors.transparent,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Image.network(
                      "https://loremflickr.com/164/36",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/drinks_food.jpg",
                          height: 36.toAutoScaledHeight,
                          width: 164.toAutoScaledWidth,
                          fit: BoxFit.cover,
                        );
                      },
                      height: 36.toAutoScaledHeight,
                      width: 164.toAutoScaledWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 9.toAutoScaledHeight,
                    left: 16.toAutoScaledWidth,
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        menu.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.toAutoScaledWidth,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
