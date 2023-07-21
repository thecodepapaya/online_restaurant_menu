import 'dart:developer';

import 'package:explorex/app/common/counter.dart';
import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/domains/explorex_data.dart';
import 'package:explorex/presentation/menu/view.dart';
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
    final controller = Get.put(_DishController(dishEntry: widget.dishEntry));

    return Scaffold(
      key: ObjectKey(widget.dishEntry),
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        controller.maxWidth.value = maxWidth;

        return Center(
          child: SizedBox(
            width: ResponsiveDesign.isDesktop ? 100.toAutoScaledHeightWithParent(maxWidth) : double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                const _CloseButton(),
                (ResponsiveDesign.isDesktop
                        ? 2.toAutoScaledHeightWithParent(maxWidth)
                        : 8.toAutoScaledHeightWithParent(maxWidth))
                    .toVerticalSpace,
                const _ImageHeader(),
                const _DishHeader(),
                const _ButtonRow(),
                ResponsiveDesign.isDesktop ? const Expanded(child: SizedBox()) : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
