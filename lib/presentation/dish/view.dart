import 'dart:developer';

import 'package:explorex/app/common/counter.dart';
import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/domains/explorex_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'controller.dart';
part 'widgets/button_row.dart';
part 'widgets/close_button.dart';
part 'widgets/dish_header.dart';
part 'widgets/image_header.dart';

class DishPage extends StatefulWidget {
  final Entry dishEntry;

  const DishPage({
    super.key,
    required this.dishEntry,
  });

  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  @override
  void dispose() {
    Get.delete<_DishController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(_DishController(dishEntry: widget.dishEntry));

    return Scaffold(
      key: ObjectKey(widget.dishEntry),
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: SizedBox()),
          const _CloseButton(),
          8.toAutoScaledHeight.toVerticalSpace,
          const _ImageHeader(),
          const _DishHeader(),
          const _ButtonRow(),
        ],
      ),
    );
  }
}
