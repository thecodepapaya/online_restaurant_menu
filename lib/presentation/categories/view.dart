import 'dart:async';
import 'dart:developer';

import 'package:explorex/app/helpers.dart';
import 'package:explorex/app/responsive.dart';
import 'package:explorex/domains/explorex_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'controller.dart';
part 'widgets/category_header.dart';
part 'widgets/category_image.dart';
part 'widgets/category_list.dart';
part 'widgets/category_tile.dart';
part 'widgets/close_button.dart';
part 'widgets/menu_types.dart';
part 'widgets/scroll_down_button.dart';

class CategoryPage extends StatelessWidget {
  final ExplorexData data;
  final String selectedCategory;
  final Menu selectedMenu;

  const CategoryPage({
    super.key,
    required this.data,
    required this.selectedCategory,
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      _CategoryController(
        data: data,
        oldSelectedCategory: selectedCategory,
        oldSelectedMenu: selectedMenu,
      ),
    );

    return WillPopScope(
      onWillPop: controller._returnToMenuScreen,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          controller.maxWidth.value = maxWidth;

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                80.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
                const _CloseButton(),
                8.toAutoScaledHeightWithParent(maxWidth).toVerticalSpace,
                Container(
                  padding: EdgeInsets.only(
                    top: 24.toAutoScaledHeightWithParent(maxWidth),
                    bottom: 16.toAutoScaledWidthWithParent(maxWidth),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: const MenuType(),
                ),
                const Divider(
                  height: 0.5,
                  color: Color(0xFFA9AAAE),
                ),
                const _CategoryHeader(),
                const _CategoryList(),
              ],
            ),
            floatingActionButton: const _ScrollDownButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
