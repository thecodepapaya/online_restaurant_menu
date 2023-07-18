import 'package:flutter/material.dart';

extension Spacing on num {
  Widget get toHorizontalSpace {
    return SizedBox(width: toDouble());
  }

  Widget get toVerticalSpace {
    return SizedBox(height: toDouble());
  }
}
