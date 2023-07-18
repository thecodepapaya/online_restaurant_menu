part of '../view.dart';

class _CategoryImage extends StatelessWidget {
  final bool isSelected;

  const _CategoryImage({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Color(0xFF3D54FF) : Colors.transparent,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(11),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ShaderMask(
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
            "https://loremflickr.com/640/360",
            height: 36.toAutoScaledHeight,
            width: 164.toAutoScaledWidth,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
