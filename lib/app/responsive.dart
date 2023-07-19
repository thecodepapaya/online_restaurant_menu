import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

extension Responsive on num {
  double get toAutoScaledWidth {
    final widthFactor = ResponsiveDesign.widthScaleFactor;

    return this * widthFactor;
  }

  double toAutoScaledWidthWithContext(BuildContext context) {
    final widthFactor = ResponsiveDesign.widthScaleFactorWithContext(context);

    return this * widthFactor;
  }

  double toAutoScaledWidthWithParent(double maxWidth) {
    final widthFactor = ResponsiveDesign.widthScaleFactorWithParent(maxWidth);

    return this * widthFactor;
  }

  double get toAutoScaledHeight {
    final widthFactor = ResponsiveDesign.widthScaleFactor;

    return this * widthFactor;
  }

  double toAutoScaledHeightWithContext(BuildContext context) {
    final widthFactor = ResponsiveDesign.widthScaleFactorWithContext(context);

    return this * widthFactor;
  }

  double toAutoScaledHeightWithParent(double maxWidth) {
    final widthFactor = ResponsiveDesign.widthScaleFactorWithParent(maxWidth);

    return this * widthFactor;
  }
}

class ResponsiveDesign {
  static const _designWidth = 375;
  static const _designHeight = 812;

  static final _deviceHeight = Get.mediaQuery.size.height;
  static final _deviceWidth = Get.mediaQuery.size.width;

  static double get heightScaleFactor => _deviceHeight / _designHeight;
  static double get widthScaleFactor => _deviceWidth / _designWidth;

  static double heightScaleFactorWithContext(BuildContext context) =>
      MediaQuery.of(context).size.height / _designHeight;
  static double heightScaleFactorWithParent(double height) => height / _designHeight;

  static double widthScaleFactorWithContext(BuildContext context) => MediaQuery.of(context).size.width / _designWidth;
  static double widthScaleFactorWithParent(double width) => width / _designWidth;
}
