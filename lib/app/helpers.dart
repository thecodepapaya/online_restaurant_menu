import 'package:flutter/material.dart';

extension Spacing on num {
  Widget get toHorizontalSpace {
    return SizedBox(width: toDouble());
  }

  Widget get toVerticalSpace {
    return SizedBox(height: toDouble());
  }
}

extension Plural on String {
  String toPlural(int count, [String suffix = 's']) {
    return count == 1 ? this : this + suffix;
  }
}
