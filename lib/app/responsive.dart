import 'package:get/get.dart';

extension Responsive on num {
  double get toAutoScaledWidth {
    final widthFactor = ResponsiveDesign.designRatio / ResponsiveDesign.deviceRatio;

    return this * widthFactor;
  }

  double get toAutoScaledHeight {
    final widthFactor = ResponsiveDesign.designRatio / ResponsiveDesign.deviceRatio;

    return this * widthFactor;
  }
}

class ResponsiveDesign {
  static const designRatio = 375 / 812;

  static final deviceRatio = Get.mediaQuery.size.aspectRatio;
}
